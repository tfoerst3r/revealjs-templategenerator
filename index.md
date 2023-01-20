---
title: This is my main objective/teaser
subtitle: This is a subtitle to explain my teaser
author: Name Nomus
date: myemail@mail.com · Eventtitle · DD.MM.- DD.MM.YYYY
theme: hifis1080p
transition: none
transitionSpeed: fast
slideNumber: \'c\'
margin: 0.0
minScale: 0.1
maxScale: 1.5
width: 1920
heigth: 1080
showNotes: false
embedded: false
---

::: notes

- Thank you for the kind introduction. / Hallo. My name is ...
- I am going to talk about ...

:::

# Examples

My main motivation to be here!

## Text

Plain Text.

- List
- *List*
- **List**

::: example
Box environment. See `_boxes.scss` for more infos.
:::

## Images

::: notes
- nice image which shows you ...
:::

![Wikipedia Logo](https://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia-logo.png){style="width:25%; margin-top:0%"}

## Code

Python code example:

~~~ python
# Here is the most minimal class
class Sample:

    # Tell python how to construct an object of that class
    def __init__(self, identifier, collector):
        self.identifier = identifier
        self.collector = collector

    # This will help us with printing the instances in a nice fashion
    def __str__(self):
        return "Sample: " + self.identifier + ", collected by " + self.collector
~~~

## Math


__@hudson_2008 [p.18]:__

::: blockquote
The coefficient of diffusion in a binary mixture of rigid elastic spherical molecules is, to first order in the density of the diffusing species, @chapman_1953 [p.245], @turns_2000 [p.114,657]  and @bird_2002 [p.526]:
:::

$$\begin{align}
D_\text{AA} 
  &= \frac13 \cdot \bar{v} \cdot \lambda 
    \quad \text{with} \quad
    \bar{v} = \sqrt[2]{\frac{8\,k_B\,T}{\pi\,m_{A}}} \quad
    \lambda = \frac{1}{\sqrt[2]{2} \pi \, d_{A}^2 \, c_A^*} \quad
    c_A^* = \frac{N_A\cdot n_A}{V}\\
  %%%%%%%%%
  &= \frac23 \frac{\sqrt[2]{\frac{k_B\,T}{\pi\,m_A}}}{\pi\,d_A^2} \cdot \frac{1}{c_A^*}
   = \frac{2}{3\pi} \frac{\sqrt[2]{\pi\,m_A\,k_B\,T}}{\pi\,d_A^2} \cdot \frac{1}{\rho_A} \\
  &= \frac23 \cdot \frac{1}{c_A^*} \cdot  \frac{1}{{\pi\,d_A^2}} \sqrt[2]{\frac{1}{\pi} \cdot k_B\,T \cdot \frac{1}{m_A}} 
\end{align}$$


## Background {data-background-color="aquamarine"}

~~~
{data-background-color="aquamarine"}
~~~

## Video

Please consider using video.js, because only `data-autoplay` works.

::: {.info style="width: 50%"}
<video data-autoplay controls>
<source data-src="//vjs.zencdn.net/v/oceans.mp4" type="video/mp4"/>
</video>
:::

## {data-background-video="//vjs.zencdn.net/v/oceans.mp4" data-background-video-loop="true"}

**Video embbeded?**

# Advanced Features

Here is some more advanced basic stuff.

## Columns and Incremental Lists

:::::::::::: {.columns}
:::::: {.column width="30%"}
<p style="text-align:center; margin-bottom:2em">
Column with 30% width!
</p>

<svg width="200" height="200">
<rect 
    width=100% 
    height=100% 
    style="fill:#E9E612;stroke-width:3;stroke:rgb(0,0,0)" 
/>
</svg>
::::::
:::::: {.column width="70%"}

<svg width=100% height=40px>
<rect 
    width=100% 
    height=100% 
    style="fill:blue;stroke-width:3;stroke:rgb(0,0,0)" 
/>
</svg>

Column with 70% width
<br>
An incremental list:
    
::: incremental
- one
- two
- three
:::

::::::
::::::::::::

## Fragments

<div class="r-stack">
  <!-- ---- -->
  <svg width="500" height="500">
  <rect width="500" height="500" style="fill:#000000;stroke-width:3;stroke:rgb(0,0,0)" />
  </svg>
  <!-- ---- -->
  <div class="fragment">
  <svg width="400" height="400">
  <rect width="400" height="400" style="fill:#666666;" />
  </svg>
  </div>
  <!-- ---- -->
  <div class="fragment">
  <svg width="300" height="300">
  <rect width="300" height="300" style="fill:#BBBBBB;" />
  </svg>
  </div>
  <!-- ---- -->
</div>

# Additional Styles

Manipulation of paragraph formatting.

<p style="font-size: 2.2em"> 
Nice to know
</p>

::: attention
:::{style="color: green; font-size: 70px;"}
Nelson Mandela: (div env manipulation)
:::
:::

::: {.blockquote style="width: 50%"}
The greatest glory in living lies not in never falling, but in rising every time we fall.
:::


## {}

&nbsp;

*Thank you for your Attention!*  
*Questions, Concerns, Feedback?*

# Literature

