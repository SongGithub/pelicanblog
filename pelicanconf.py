#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals
import os
AUTHOR = u'Song Jin'
SITENAME = u"Song's blog - on local machine"

SITEURL = os.path.dirname(os.path.dirname(__file__))
THEME = "themes/voidy-bootstrap"

TIMEZONE = 'Australia/Melbourne'
DEFAULT_DATE = 'fs'

DEFAULT_LANG = u'en'

THEME_STATIC_DIR = ('theme')
RELATIVE_URLS = True

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

# I am the only one writing to it, so no need for such a filter
AUTHOR_URL = ''
AUTHOR_SAVE_AS = ''

# Formatting for urls
ARTICLE_URL = "posts/{date:%Y-%m}/{slug}/"
ARTICLE_SAVE_AS = "posts/{date:%Y-%m}/{slug}/index.html"

CATEGORY_URL = "category/{slug}"
CATEGORY_SAVE_AS = "category/{slug}/index.html"

TAG_URL = "tag/{slug}/"
TAG_SAVE_AS = "tag/{slug}/index.html"

# Generate yearly archive
YEAR_ARCHIVE_SAVE_AS = 'posts/{date:%Y}/index.html'

DISPLAY_PAGES_ON_MENU = True
DISPLAY_CATEGORIES_ON_MENU = True
USE_FOLDER_AS_CATEGORY = True
DELETE_OUTPUT_DIRECTORY = True
SUMMARY_MAX_LENGTH = 40
