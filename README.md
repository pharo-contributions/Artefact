# Artefact

Artefact is a framework to generate PDF documents in Pharo.

Artefact is written and supported by Olivier Auverlot and Guillaume Larcheveque (aka The Pasta Team) 

[![Unit Tests](https://github.com/pharo-contributions/Pharo-Pomodoro/workflows/Build/badge.svg?branch=master)](https://github.com/pharo-contributions/Artefact/actions?query=workflow%3ABuild)
[![Coverage Status](https://codecov.io/github/pharo-contributions/Pharo-Pomodoro/coverage.svg?branch=master)](https://codecov.io/gh/pharo-contributions/Artefact/branch/master)

[![Pharo 6](https://img.shields.io/badge/Pharo-6.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 7](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 8](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 9](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)

## Description

It is fully written in Smalltalk and doesn't require any native library. Artefact is light, platform independant and offer to users a high level of abstraction in order to easily creating PDF documents.

- Completely written in Smalltalk (and only Smalltalk),
- Complete freedom about the order of creation for pages, elements... (no need to follow the document order)
- Multi format and orientation for pages
- Page composition based on reusables PDF elements,
- Extensibility by offering a composition standard to create your own high level elements
- StyleSheet that can be reused in many documents and avoid wasting time and place with duplication
- Image support with JPEG and PNG formats
- Pre-defined high level elements like datagrid
- Support PDF compression to produce compact files

[![Demo](https://img.youtube.com/vi/Jc_Z_YnW2uM/0.jpg)](https://www.youtube.com/watch?v=Jc_Z_YnW2uM)

## Install Artefact 

To install Artefact on your Pharo image you can just execute the following script:

```Smalltalk
    Metacello new
    	githubUser: 'pharo-contributions' project: 'Artefact' commitish: 'master' path: 'src';
    	baseline: 'Artefact';
    	load
```

To add Artefact to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'Artefact'
    	with: [ spec repository: 'github://pharo-contributions/Artefact:master/src' ]
```

Note that you can replace the #master by another branch as #development or a tag as #v1.0.0, #v1.? or #v1.2.? .

## Getting started

To start using Artefact, you should look at the Artefact tutorial in the Help Browser of Pharo (accessible from the World menu)
