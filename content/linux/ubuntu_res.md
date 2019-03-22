Title: How to set correct resolution on Ubuntu 18.04 LTS
Date: 2019-3-22 22:35
Tags: ubuntu resolution
Slug: ubuntu-resolution
Authors: Song.Jin
Summary: how I setup correct resolution for my Ubuntu

# Why writing this

I want to run Ubuntu on my Lenovo laptop with a 2560x1440@60Hz monitor. But there is
no such resolution in Display setting's resolution list.

And I went through many online articles. finally I found one method works for me


# The code

modelline is the string I got after run `umc 2560 1440 55 --rbt`, while DP-3 is the active display output channel that I found after run `xrandr`

```
#!/usr/bin/env bash

modelline='"2560x1440x54.97" 221.000000 2560 2608 2640 2720  1440 1443 1447 1478  +HSync -VSync'

model=$(echo $modelline | awk {'print $1'})

xrandr --newmode $modelline

xrandr --addmode DP-3 $model

xrandr --output DP-3 --mode $model

```


# The trick I found the hard way

- `cvt` command that everyone is talking, is not really working in my case, instead `umc` works like a charm!

- do not let frequency very high, or you would have blinky screen!
