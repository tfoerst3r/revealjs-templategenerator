#=========================#
#======= VARIALBES =======#
#=========================#
#-- Installation of reveal.js
REVEALJS           ?= reveal.js
REVEALJSDEPLOY     ?= $(REVEALJS)_deploy
REVEALJS_WEBSOURCE ?= https://github.com/hakimel/reveal.js/archive/master.zip 
REVEALJS_ZIPFILE   ?= reveal-latest.zip 
REVEALJS_MODULES   ?= $(REVEALJS)/node_modules

#-- File lists
THEMEFILES    ?= $(wildcard ./custom/themes/*.scss) 
TEMPLATEFILES ?= $(wildcard ./custom/templates/*.scss)
IMAGEFILES    ?= $(wildcard ./custom/images/*)
FONTFILES     ?= $(wildcard ./custom/fonts/*)
PLUGINFOLDERS ?= ./custom/plugins/*
#-- Build presentation
BUILD_PRES ?= script.sh
#override dependent ?= 3
#override slide-level ?= 2
#override input ?= index.md
#override background ?= ""
override to ?= /opt/reveal.js


#-- Location where to copy files
IMAGES_DEST_FOLDER   ?= ./$(REVEALJS)/dist/theme/images/
FONTS_DEST_FOLDER    ?= ./$(REVEALJS)/dist/theme/fonts/
THEME_DEST_FOLDER    ?= ./$(REVEALJS)/css/theme/source/
TEMPLATE_DEST_FOLDER ?= ./$(REVEALJS)/css/theme/template/
PLUGIN_DEST_FOLDER   ?= ./$(REVEALJS)/plugin/


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
	plugin_copy \
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

plugin_copy:
	cp -rv $(PLUGINFOLDERS) $(PLUGIN_DEST_FOLDER)	

#-- scss compiling --#
themes_compile: scss_copy
	cd $(REVEALJS) && npm run build -- css-themes

#==============================#
#======= MAIN -- DEPLOY =======#
#==============================#
deploy: clean-deploy
	ln -s $(to) tmp_$(REVEALJS)
	cd tmp_$(REVEALJS) && rm -rf *
	cp -r ./$(REVEALJSDEPLOY)/* tmp_$(REVEALJS)/
	rm tmp_$(REVEALJS)
	rm -rfv $(REVEALJSDEPLOY)

clean-deploy:
	mkdir $(REVEALJSDEPLOY) && cd $(REVEALJS) && mv dist/ plugin/ ../$(REVEALJSDEPLOY)

#=============================#
#======= MAIN -- CLEAN =======#
#=============================#

clean:
	rm -rfv $(REVEALJS)
	rm -fv  $(REVEALJS_ZIPFILE)
	rm -fv *.pdf
	rm -fv *.html


