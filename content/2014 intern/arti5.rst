:title: Add icon on websites
:date: 2014-03-14 16:00
:tags: icon, website, decoration, todolist, pelicanblog
:category: Tech talk
:slug: icon
:author: Song the author
:summary: About how I put icon on my sites

The gap between my sites and well-established sites has been my motivations to learn. Today, the gap I realised is the icon. The tiny little icon on visitors' browser tab and bookmark menu really makes website unique and having more visual impact on visitors rather than abstract text.

Steps:
======
1. Generate an icon
-------------------
There are many on-line icon generating sites available. Google out one of them, upload your local picture, then it will be downloaded after you select size which is typically 32X32. Hint here is you'd better chop your upload photo into square shape locally before uploading it, otherwise the photo would be distorted in ugly way.

2. Upload the photo onto photo-hosting sites
--------------------------------------------
It is always to use reputable service rather than those would vanish in near future. In my case, I used Gravatar which is same photo-host for my profile on Github and Linkedin. Afterwards, I copied the link to this photo.

3. Find out appropiate place in your site to put icon's link
------------------------------------------------------------
I found it is handy to put the link in header section of the base file of HTML files. For pelican blog, I put it in the base.html of the theme template I am using. Then uninstall current one, re-install it. For my app on heroku, it is easier, just put the link on base.html.

4. Verify the change locally and Push modified sites up to servers
------------------------------------------------------------------
I tested both sites locally, making sure they were fine. Then push them up to servers. Voala! I found my icons (my head) on browser tabs!