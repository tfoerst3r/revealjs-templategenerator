---
title: revealjs templategenerator
---

# Description

This tool generates usable reveal.js themes from your peronsal/company layouts. They can be implemented as easily as 
the default layouts.

Basis for the layouts is your custom `*.scss` file. It will be recompiled with reveal.js in mind and it generats an 
reveal.js folder which can utilized for your projects and even deployed as a web resource for online projects.

# Requirements:

- npm
- live-server
- decktape
- md2reveal (bash tool by tfoerst3r on github)

# Generating a reveal.js instance (first time)

1) clone/download this project
1) create your themes in `./custom/theme/`
    - create additional helper files, if needed in `./custom/templates/`
    - add needed background images in `./custom/images/`
    - add needed fonts in `./custom/fonts/`
1) run `$ make build` (this will build the reveal.js structure)
1) run `$ make deploy to=<PATH>` to copy the needed files to global place

# Other useful commands

- Updating existing templates (only theme files)

    ~~~
    $make install_themes
    ~~~

- Updating existing theme

    ~~~
    $make themes_compile
    ~~~

- Run a live server (also allows for video playback)
    
    ~~~
    $ make show
    ~~~
    or
    ~~~
    $ live-server
    ~~~

- remove all not needed files for using the reveal.js

    ~~~
    $ make clean-working
    ~~~

- remove all all files installed by build 

    ~~~
    $ make clean
    ~~~

- clean reinstall

    ~~~
    $ make clean && make build
    ~~~


# Example script to create a presentation template

Run the following in a bash shell. You may change the variables

- `revealjs_location`
- `katex_location` (only if latex is needed)

to your liking. 

~~~
folderC="c_slides"

mdscript="#!/bin/bash
options=\"\\
--revealjs ./reveal.js \\
--bibliography \$HOME/literature/literature.bib \\
--output index.html\"

#--title-background-color #0064aa \\

md2reveal \$options \$1
"

#-----------------------#

baseslides="---
title: Title
author: Max Mustermann
date: myemail@mail.com · Eventtitle · DD.MM.- DD.MM.YYYY
theme: black
slideNumber: \'c\'
width: 1920
heigth: 1080
---

# Chapter 1

## Subchapter A

## Subchapter B

# Chapter 2
"

#-----------------------#

#-- Variables --#
pres_file="slides.md"
script_file="script.sh"
revealjs_location="/opt/reveal.js"
katex_location="/opt/katex"

mkdir \
    a_application \
    b_images \
    $folderC \
    d_orga
touch README.md

cd $folderC
mkdir images
ln -s $revealjs_location reveal.js
ln -s $katex_location katex

echo "$mdscript" > $script_file
echo "$baseslides" > $pres_file
bash $script_file $pres_file
~~~

