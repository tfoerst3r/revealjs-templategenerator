#=========================#
#======= VARIALBES =======#
#=========================#
#-- Installation of reveal.js
REVEALJS           ?= reveal.js
REVEALJS_WEBSOURCE ?= https://github.com/hakimel/reveal.js/archive/master.zip 
REVEALJS_ZIPFILE   ?= reveal-latest.zip 
REVEALJS_MODULES   ?= $(REVEALJS)/node_modules

#-- File lists
THEMEFILES    ?= $(wildcard ./custom/themes/*.scss) 
TEMPLATEFILES ?= $(wildcard ./custom/templates/*.scss)
IMAGEFILES    ?= $(wildcard ./custom/images/*)
FONTFILES     ?= $(wildcard ./custom/fonts/*)

#-- Build presentation
BUILD_PRES ?= script.sh
#override dependent ?= 3
#override slide-level ?= 2
#override input ?= index.md
#override background ?= ""

#-- Location where to copy files
IMAGES_DEST_FOLDER   ?= ./$(REVEALJS)/dist/theme/images/
FONTS_DEST_FOLDER    ?= ./$(REVEALJS)/dist/theme/fonts/
THEME_DEST_FOLDER    ?= ./$(REVEALJS)/css/theme/source/
TEMPLATE_DEST_FOLDER ?= ./$(REVEALJS)/css/theme/template/

#=================================#
#======= MAIN -- md2reveal =======#
#=================================#
presentation: 
	./$(BUILD_PRES)

show:
	live-server

#===============================#
#======= MAIN -- PREPARE =======#
# (A) install reveal.js and packages
# (B) install custom themes
#===============================#
build: $(REVEALJS) $(REVEALJS_MODULES) install_themes 

#----------------------------#
#-- REVEAL.JS INSTALLATION --#
#----------------------------#
$(REVEALJS_MODULES): $(REVEALJS) $(REVEALJS_ZIPFILE)
	cd $(REVEALJS) && npm install --unsafe-perm

$(REVEALJS): $(REVEALJS_ZIPFILE) 
	unzip $(REVEALJS_ZIPFILE)
	mv reveal.js-master $(REVEALJS)

$(REVEALJS_ZIPFILE): $(REVEALJS_ZIPFILE)
	wget -O $(REVEALJS_ZIPFILE) $(REVEALJS_WEBSOURCE)

#--------------------------------#
#-- CUSTOM THEMES INSTALLATION --#
#-- scss / images / fonts -------#
#--------------------------------#
install_themes : \
	scss_copy \
	images_copy \
	fonts_copy \
	themes_compile

#-- scss --#
scss_copy:
	cp -rv $(THEMEFILES) $(THEME_DEST_FOLDER)
	cp -rv $(TEMPLATEFILES) $(TEMPLATE_DEST_FOLDER)

#-- images --#
images_copy:
	mkdir -p  $(IMAGES_DEST_FOLDER)
	cp -rv $(IMAGEFILES) $(IMAGES_DEST_FOLDER)

#-- fonts --#
fonts_copy:
	mkdir -p  $(FONTS_DEST_FOLDER)
	cp -rv $(FONTFILES) $(FONTS_DEST_FOLDER)

#-- scss compiling --#
themes_compile: scss_copy
	cd $(REVEALJS) && npm run build -- css-themes

clean-working: save-base clean restore-base

save-base:
	cd $(REVEALJS) && mv dist/ plugin/ .. 
	mv index.html index.html.backup

restore-base:	
	mkdir $(REVEALJS) && mv dist/ plugin/ $(REVEALJS)
	mv index.html.backup index.html

clean: 
	rm -rfv $(REVEALJS)
	rm -fv  $(REVEALJS_ZIPFILE)
	rm -fv *.pdf
	rm -fv *.html


