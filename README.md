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
1) create your theme in `./custom/theme/`
1) create additional helper files, if needed in `./custom/templates/`
1) add needed background images in `./custom/images/`
1) add needed fonts in `./custom/fonts/`
1) run `$ make build` (this will build the reveal.js structure)
1) either use the folder as is or copy it to a global location, like `/opt/`

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

- build a presentation (needs corresponding commands in separated file (`script.sh`)

    ~~~
    $ make presentation
    ~~~
    or
    ~~~
    $ bash script.sh
    ~~~

- remove all not needed files for using the reveal.js

    ~~~
    $ make clean-working
    ~~~

- remove all all files installed by build 

    ~~~
    $ make clean
    ~~~


