# eMindHub
## A gulpified Bootstrap theme for emindhub.com

<aside style="background: orange; color: white; padding: 1em 1.5em; font-size: 1.5em;">Please read this file carefully before doing anything.</aside>

We have implemented a build process around the **[Gulp task-runner](http://gulpjs.com/)**. With its help, we can control preprocess and optimize our CSS, scripts, SVG and images in less than a second.

## Prerequisite

All the commands of our build process are made in a bash terminal. We assume you are already familiar with it. Now if one of these programs is not installed on your machine, follow the associated links to do so.

* [node.js](http://nodejs.org/)
* [npm](https://github.com/npm/npm)
* [Ruby](https://www.ruby-lang.org/en/installation/)
* [Less](http://lesscss.org/)

## Installation

1. Open a terminal and go to the src/ folder of the theme&#8201;:

  ```bash
  $ cd {path_to_the_theme}/src
  ```

2. Install gulp globally&#8201;:

  ```bash
  $ sudo npm install -g gulp
  ```

3. Install npm packages&#8201;:

  ```bash
  $ sudo npm install
  ```

4. Hack of the malformed css-purge package&#8201;:

You maybe will be forced to manually duplicate src/node_modules/css-purge/lib/css-purge.js to src/node_modules/css-purge/lib/css_purge.


## Usage

### CSS

All css are generated from less files located at src/less.

### Javascript

The js/emindhub.js file is a concatenation of our own written scripts in src/js/*.

init.js is used for initialization, other logics should be placed in the lib subdir.

### Images

Images are also preprocessed for optimization. For this reason, images should be placed in src/images to be treated.

### Tasks

Default task, processed in development mode&#8201;:

```bash
$ gulp
```

Watch task, using livereload&#8201;:

```bash
$ gulp watch
```

Release to production task&#8201;:

```bash
$ gulp --production
```

## Theming eMindHub

### Style

#### Theming Bootstrap files

The following files are simply duplicates from the Bootstrap library. With
modifications in were to reference the imports. In theory, you could replace
them if you update the Bootstrap framework by copying them from that framework
again. Just make sure to modify the import paths to reference the
`./bootstrap/less` folder:
```
./less/bootstrap.less
./less/responsive.less
./less/variables.less
```

The `./less/variables.less` file is generally where you will spend most of
your time customizing the various Bootstrap settings. Feel free to manually
edit it or even replace it with a service like
[BootTheme](http://www.boottheme.com).

The `./less/overrides.less` file contains various Bootstrap and Drupal fixes. It
may contain a few enhancements, feel free to edit this file as you see fit.

#### Theming eMindHub files

The following files are relatively blank (they may contain some code for the
inital sub-theme), but this is where you will actually spend most of your time
specifying specific styling for your sites configuration.
```
./less/header.less
./less/content.less
./less/footer.less
```

And finally, the `./less/style.less` file is the glue that holds it all
together and compiles everything into one file. Generally, you will not need
to modify this file unless you need to add or remove imported files. For
example, if you do not want your site to have responsive capabilities, free to
comment or remove that line. If you are a file hierarchy wizard and need to
separate your theme into multiple files, insert additional `@import '...';`
lines.

### Templates

#### In template.php

Wrappers for Menus footer and user_menu are overriden

## Contributors

[Laetitia Debruyne](http://laetitiadebruyne.com)


## License

[ISC](https://www.isc.org/downloads/software-support-policy/isc-license/) © [2004-2013 by Internet Systems Consortium, Inc. (“ISC”)](https://www.isc.org/downloads/software-support-policy/isc-license/)

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
