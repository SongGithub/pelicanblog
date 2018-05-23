#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
import os

AUTHOR = u'Song Jin the local machine'
SITENAME = u"Song's blog - on Local machine"

SITEURL = os.path.dirname(os.path.dirname(__file__))

THEME = "themes/bootstrap"

THEME_STATIC_DIR = ('themes')
os.path.join(SITEURL, 'templates'),
RELATIVE_URLS = True

TIMEZONE = 'Australia/Melbourne'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

# 'project links'
LINKS =  (
          ('Songs to do list','http://songs-todolist.herokuapp.com'),
         )

# Social widget
SOCIAL = (
            ('Github','https://github.com/SongGithub'),
            ('Linkedin', 'http://au.linkedin.com/in/songjinau'),
         )

TAG_CLOUD_STEPS = 3
TAG_CLOUD_MAX_ITEMS = 300

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
RELATIVE_URLS = True

# Formatting for urls

ARTICLE_URL = "posts/{date:%Y}/{date:%m}/{slug}/"
ARTICLE_SAVE_AS = "posts/{date:%Y}/{date:%m}/{slug}/index.html"

CATEGORY_URL = "category/{slug}"
CATEGORY_SAVE_AS = "category/{slug}/index.html"

TAG_URL = "tag/{slug}/"
TAG_SAVE_AS = "tag/{slug}/index.html"

# Generate yearly archive

YEAR_ARCHIVE_SAVE_AS = 'posts/{date:%Y}/index.html'

# markDown support
# MARKDOWN = {
#     'extension_configs': {
#         'markdown.extensions.codehilite': {'css_class': 'highlight'},
#         'markdown.extensions.extra': {},
#         'markdown.extensions.meta': {},
#     },
#     'output_format': 'html5',
# }

DISPLAY_PAGES_ON_MENU = True
USE_FOLDER_AS_CATEGORY = True