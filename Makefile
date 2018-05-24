PELICAN="docker-compose run --rm pelican"
dcr := docker-compose run --rm

BASEDIR=$(CURDIR)
INPUTDIR=content
OUTPUTDIR=output
CONFFILE=pelicanconf.py
PUBLISHCONF=publishconf.py

help:
	@echo 'Makefile for a pelican Web site                                        '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make html                        (re)generate the web site          '
	@echo '   make clean                       remove the generated files         '
	@echo '   make regenerate                  regenerate files upon modification '
	@echo '   make publish                     generate using production settings '
	@echo '   make serve [PORT=8000]           serve site at http://localhost:8000'
	@echo '   make devserver [PORT=8000]       start/restart develop_server.sh    '
	@echo '   make stopserver                  stop local server                  '
	@echo '                                                                       '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html'
	@echo '                                                                       '

html:
	@$(dcr) pelican-py pelican $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

regenerate:
	@$(dcr) pelican-py pelican -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
ifdef PORT
	cd $(OUTPUTDIR) && $(dcr) -p $(PORT):$(PORT) pelican-server python -m pelican.server $(PORT)
else
	cd $(OUTPUTDIR) && $(dcr) -p 8000:8000 pelican-server python -m pelican.server 8000
endif

devserver:
ifdef PORT
	$(BASEDIR)/bin/develop_server.sh restart $(PORT)
else
	$(BASEDIR)/bin/develop_server.sh restart
endif

stopserver:
	kill -9 `cat pelican.pid`
	kill -9 `cat srv.pid`
	@echo 'Stopped Pelican and SimpleHTTPServer processes running in background.'

publish:
	@echo "publishing pelican content"
	@$(dcr) pelican-py pelican $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF)

.PHONY: html help clean regenerate serve devserver publish setup_git
