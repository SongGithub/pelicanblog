Title: Kubernetes Apiserver latency alert with Prometheus
Date: 2018-9-22 14:35
Tags: devops
Slug: apiserver-prom-alert
Authors: Song.Jin
Summary: how I setup alert for kubernetes apiserver high latency

> Good devops engineers won't let anyone else to tell them that your systems have problems.

My team has realised it the hard way that the apiserver and the etcd module
behind it has limited resource to deal with objects inside Kubernetes. For
example, if one of your program trying to query large amount of objects, apiserver
and the etcd module will freak out. As a result, all apiserver users would
experience very long response time. Good devops engineers won't let anyone
else to tell them that your systems have problems.
That is why I am trying to add an alert for such events.

## Problem break down

While it is true that there are delays from network component even the operators
laptop, we can only monitor objective metrics scaped from server. Please be aware
the trade-off here is that we are ignoring a part of high latency perceived by
users: non-server related delays.

In Prometheus, there are 2 ways we can monitor. One is tracking
absulte value of the latency, the other is finding increase rate of it.


## My 1st failed attempt

In my first attempt, I tried a metric `apiserver_request_latencies_summary`.
Good thing about it is that the metric shows an absolute value in mirco seconds.
However, it is not very suitable for a responsive alerting system. The metric
summarises data from a sliding window upto 5 hours. So if your system has been
okey, then suddenly went bad. The high rate of latency won't be picked up until
very long time later that averaged value of the past 5 hours has crossed your
set threshold. The delay in alerting could be upto 1.5 hours, and alert won't
cool down until same delay time past actual end of the incident. Alert setting
in PromQL:
`avg_over_time(apiserver_request_latencies_summary{job="kubernetes-apiservers", verb!~"WATCH|CONNECT", quantile="0.9"}[5m]) / 1000 > 3000`

## My 2nd attempt

As an improvement to the above alert, I found a project on Github called
`Prometheus Operator`. One of their *rules* uses metric
 `apiserver_request_latencies_bucket`, then visualise it with `histogram_quantile`
The query makes the alert very responsive to sudden surge of apiserver latency.
`avg by(resource, verb) (histogram_quantile(0.95, rate(apiserver_request_latencies_bucket{verb!~"^(?:WATCH|CONNECT)$"}[5m])) / 1e+06 > 0) > 1`

In the mentioned *rules*, thresholds were set to >1:warning, and >4:critical

## Personal reflection

External factors make it harder for me to work on this task. First is lack of
proper documentation about the metrics. Not finding any offical documentation,
I had to dig down to source code, only to find a few inline code comments helping
make sence of the metrics. But when I came back to Prometheus, what? Metrics in
source code has different names here, and some metrics here can't be found in
source code.

Another thought is that the high-latency scenario needs some effort to re-produce
in order to test your alert. For my case, my team came up with this code to create
huge amount of objects to query which will lead to high latency. You would need
to generate at least 7 thousand objects to execrise apiserver capability.

Final thoughs are:
- why sudden surge of objects could happen
- could we have pagination at apiserver level or at etcd level?
- could performance optimisation help? such as, using high IOPS instance for etcd.
```
#!/usr/bin/env bash
 set -e
 counter=0
while true; do
       counter=$((counter+1))
       sleep 0.1
       cat config-map.yaml| sed s/\$INDEX/$RANDOM/g | kubectl apply -f - > /dev/null &
       if [[ "$counter" -gt 30000 ]]; then
         echo "Counter: $counter times reached; Exiting loop!"
         exit 1
       fi
done
```
*config-map.yaml*
```
---
apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    app: prometheus
    component: server
    repo: ops-kube-system
    deployed-with: kt
    owner: songjin
  name: test-cm-$INDEX
  namespace: kube-system
```

## Summary
Hopefully you can learn from my journey above, and save some struggle.
