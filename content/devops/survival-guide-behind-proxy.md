Title: Survival guide when working behind company proxy - Docker
Date: 2019-10-30 16:01
Tags: devops
Slug: survive-proxy-docker
Authors: Song.Jin
Summary: a guide to work with company proxy

## the story

I was trying to login to AWS ECR from a machine inside company proxy. Out of
blue, I got time-out error!
```
Error response from daemon: Get https://aws-account.dkr.ecr.... request cancelled
while waiting for connection (Client.Timeout exceeded while waiting for headers)
```


## the explore

From my experience, it is comming from company proxy which blocks your network
traffic quietly again. But problem is most of Google-search results suggest to
reconfig *systemd* which is not available to my machine( it doesn't have it, and
I can't install it)

## the solution

Let cut to the cheese. Assuming you have root permission to the machine,

- add proxy settings to `/etc/sysconfig/docker` file.
```
sudo su -
echo 'export http_proxy=http://<company-proxy:proxy-port>' >> /etc/sysconfig/docker
echo 'export https_proxy=http://<company-proxy:proxy-port>' >> /etc/sysconfig/docker
echo 'export no_proxy=[list-of-internal-domains]' >> /etc/sysconfig/docker
```
- restart docker daemon
`sudo service docker restart`

- prove if you could run Docker login command correctly, response should be *Login succeed*
`$(aws ecr get-login --no-include-email)`

## the traps

I feel it is nice to share traps I fell into, so that you wouldn't experience
the same pain I have been through.

- no_proxy should contain company internal domains, and no more. Those domains
that are behind company firewall should be here, but anything else should go
through the forwardproxy.

- It is good to align your tools with what are popular on the market. If I used
any AMIs that contains *systemd*, I could have copy&paste solution from the first
Google search result for this error message. The AMI I used is Amazon 1, which
doesn't have *systemd*. So if I do it again, I would just pick an AMI shipped with
*systemd* which is popular on the Internet.

