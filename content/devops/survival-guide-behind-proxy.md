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