#!/bin/bash

dependent=3
slidelevel=2
input=index.md
background="./images/blue.svg"

md2reveal --dependent $dependent --slide-level $slidelevel --background $background -o index.html $input
#pandoc -t revealjs -s -o index.html -V revealjs-url=./reveal.js $input


