:title: The Project Ellingtonia 
:date: 2014-03-25 16:00
:tags: Flask, Jinja2
:category: Projects
:slug: ellingtonia
:author: Song the author
:summary: Things about the project Ellingtonia

Ellingtonia
===========

The 'ellingtonia' is a documentation organiser.

It is an app created for Tangent Snowball Australia's documentation site, managing content structure by comany and project name.

The name of the app 'ellingtonia' is inspired by Guitarist Django's second album with the same name, as the app is my second Django project.

'Problem to be solved'
======================
 company's documentation site needs to be more organised, by client's company names then project names. The app will run on server and dynamatically read documents' up-to-date directory structure and generate a structured view to sort projects by company name, then project names. 

It was suggested to use Flask which compromises Werkzeug, Jinja2, and 'Good intentions'. 

Approach: I came, I saw, I divide, and I conquer
================================================
Conquer of the problem compromises 3 separate phrases/components. First the program reads the directory structure, then it feeds content into Jinja2 in a desirable format. At last it Jinja generates view which is hosted by Flask. 

Result:
=======
It was successfully implemented with Jinja2 module in the Flask but served by uWSGI.
And the url of the project is https://github.com/SongGithub/ellingtonia