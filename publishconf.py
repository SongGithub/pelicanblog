#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
import os

AUTHOR = u'Song Jin'
SITENAME = u"Song's blog on the Github"

SITEURL = 'http://songgithub.github.io/pelicanblog/'

THEME = "bootstrap"

TIMEZONE = 'Australia/Melbourne'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None 
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

# Project Links
LINKS =  (
          ('Songs to do list','http://songs-todolist.herokuapp.com'),
         )

# Social widget
SOCIAL = (
          ('Github','https://github.com/SongGithub'),
          ('Linkedin', 'http://au.linkedin.com/in/songjin123'),
#           ('Anothergoo social link', '#'),
         )

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

# Formatting for urls
ARTICLE_URL = "posts/{date:%Y}/{date:%m}/{slug}/"
ARTICLE_SAVE_AS = "posts/{date:%Y}/{date:%m}/{slug}/index.html"

CATEGORY_URL = "category/{slug}"
CATEGORY_SAVE_AS = "category/{slug}/index.html"

TAG_URL = "tag/{slug}/"
TAG_SAVE_AS = "tag/{slug}/index.html"

# Generate yearly archive

YEAR_ARCHIVE_SAVE_AS = 'posts/{date:%Y}/index.html'

TAG_CLOUD_STEPS = 3
TAG_CLOUD_MAX_ITEMS = 300
GOOGLE_ANALYTICS = 'UA-48669344-1'