# HTML Attributes

Written by stakr GbR (Jan Sebastian Siwy, Martin Spickermann, Henning Staib GbR; http://www.stakr.de/)

Source: https://github.com/stakr/html_attributes

A plugin which converts arrays und hashes intuitively into valid HTTP attributes.

Makes your views more Ruby like.


## Example: Class Attribute

If you want to build a class attribute containing some classes depending on some conditions
you can simply assign the class names to their conditions:

    # Ruby 1.8.x
    content_tag(:div, :class => { :first => true, :second => false, :third => true }) { ... }

    # Ruby >= 1.9.1
    content_tag(:div, class: { first: true, second: false, third: true }) { ... }

Result:

    <div class="first third">...</div>


## Example: Style Attribute

Previously you had to create a String containing all the style definitions if it was necessary to format
a HTML tag directly.

    content_tag(:div, :style => "margin-top: 10px; margin-left: 5px; font-size: 12pt;")  { ... }

Now you can write pure Ruby using nested Hashes:

    # Ruby 1.8.x
    content_tag(:div, :style => { :margin => { :top => 10.px, :left => 5.px }, :font_size => 12.pt })  { ... }

    # Ruby >= 1.9.1
    content_tag(:div, style: { margin: { top: 10.px, left: 5.px }, font_size: 12.pt })  { ... }

Once you need to build a dynamic style attribute it is no longer necessary to insert the values into a String
or to concatenate snippets.


Copyright (c) 2009 stakr GbR (Jan Sebastian Siwy, Martin Spickermann, Henning Staib GbR), released under the MIT license
