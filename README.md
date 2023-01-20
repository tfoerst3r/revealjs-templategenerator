
# Useful commands

Requirements:

- live-server
- decktape


- Run a live server (also allows for video playback)
    
    ~~~
    $ live-server
    ~~~

- Generate PDF

    ~~~
    $ decktape automatic --size 1920x1080 index.html index.pdf
    ~~~

- Recompile the custom `*.scss` files

    ~~~
    $ make themes_compile
    ~~~

# Tray

## PDF

~~~
DTAPP ?= $(HOME)/node_modules/.bin/decktape
OUTPUTPDF ?= $(shell basename $(PWD))-$(USER).pdf 
~~~

~~~
#----------------#
#-- pdf output --#
#----------------#
#prepared_for_pdfs :
#	npm install decktape
#
#
#pandoc_theme.html :
#	pandoc -D revealjs > pandoc_theme.html
#
##TODO: try to obtain the name of the repo
##      and use it for the pdf name
#$(OUTPUTPDF): index.pdf
#	cp -v $< $@
#
#pdf: $(OUTPUTPDF)
#
#%.pdf : %.html prepared_for_pdfs
#	$(DTAPP) --pdf-author steinb95 --pdf-title $(shell basename $(PWD)) reveal $<\?fragments=true $@
#
#print_images: index.md
#	grep '\!\[' index.md|grep -v 'http'|sed -e 's@.*(\(.*\)).*@\1@'|sed -e 's/{\(.*\)}/\1/'
#	grep 'data-background-image' index.md|sed -e 's@.*image="\(.*\)" .*@\1@'
#
#add_images:
#	git add -f -v `grep '\!\[' index.md|grep -v http|sed -e 's@.*(\(.*\)).*@\1@'|sed -e 's/{\(.*\)}/\1/'`
#	git add -f -v `grep 'data-background-image' index.md|sed -e 's@.*image="\(.*\)" .*@\1@'`
~~~


