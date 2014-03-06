:title: The deeper you dig, the more you explore
:date: 2014-03-05
:tags: professional, ngix, uwsgi
:category: Career-Intern Life
:slug: thedeeperthebetter
:author: Song the author
:summary: getting to learning more by doing more

My observation today is the deeper I dig, the more I can explore
================================================================
For the pelican blog, I have been strictly following pelican site's instuctions, especially the way I serve the website. However, the method named 'simpleHTTP' has strange habbit that delay my changes on website randomly. It seems to have its own mind which rander itself very unreliable.

Gold Digged out today
---------------------
By the end of the day, I discuss this with Moose. Besides recommendation that 'simply run the static site by click on index.html in the output folder', he also advised me industial practice of using 'uwisg' to serve (Ngnix for remote end runs). Even more, when we looked into source code of uwisg, unix sockets that work on lower level of hierarchy, revealed which are something new for me. I am so glad to know what could have been done better, like discovered trace of gold after days of hard digging in this hole named Pelican blogging.