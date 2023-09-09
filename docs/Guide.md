# ARTEFACT

An easy to use, extensible and cool framework to generate PDF

Authors: Olivier Auverlot and Guillaume Larcheveque aka The Pasta Team with contributions from Pharo Community

PS: Titles are stupid but it was a hard work to express our pleasure to work together.

## Introduction: The PDF stays where it is, and the Artefact move the universe around it

Artefact is a framework to generate PDF documents. It is fully written in Smalltalk and doesn't require any native library. Artefact is light, platform independant and offer to users a high level of abstraction in order to easily creating PDF documents.  

- completely written in Smalltalk (and only Smalltalk),
- complete freedom about the order of creation for pages, elements... (no need to follow the document order)
- multi format and orientation for pages
- page composition based on reusables PDF elements,
- extensibility by offering a composition standard to create your own high level elements
- styleSheet that can be reused in many documents and avoid wasting time and place with duplication
- image support with the JPEG format
- pre-defined high level elements like datagrid
- support PDF compression to produce compact files

## Your first PDF document (for dummies)
The best way to start with Artefact is to look at Artefact-Demos package and to run each PDFDemos class methods.

By default each generation result is written in the default pharo directory but you can define your own in the demoPath method 

Example: 

```Smalltalk
demoPath
    ^ '/Users/pharo/pdf/'
```

If you want to run all demos, just execute: 

```Smalltalk
PDFDemos runAllDemos 
```

## Artefact global scheme, the cortex syndrom

The basic brick in Artefact is the **PDFDocument** which represent the whole document. In this PDFDocument you will add some **PDFPage**. A page is a drawing surface where you can put any **PDFElement**. Elements are the graphics object like texts, lines, arrows… Elements can be more complex as we will see in the **PDFCompositeElement** section. Every PDFElement can be included in a more complex composite elements and reused in many documents. We encourage you to create your own elements library and share it with other users.

Unlike many PDF frameworks, you don't have to create your pages in the order you want to print them. Moreover you can use the same page in many documents. Elements follow the same logical at the page level.

Artefact use a tree structure to represent a document. It's important to understand that any property defined at a level will be applied at lower levels and will surcharge a higher one (example: if you define a format at the document level, it will be applied on all pages except the ones that define a specific format).

As you can see, Artefact is really easy to use:

```Smalltalk
PDFDocument new add: (PDFPage new add: (PDFTextElement new text: 'Hello'; from: 10mm@10mm)); exportTo: 'test.pdf' asFileReference writeStream
```

## Positionning elements with the unprobability drive

Coordinates start from the upper left corner *(0mm@0mm)*. As you can expect the x axis is the horizontal one and the y axis the vertical one. By convention, every PDFElement is positioned from his upper left corner.

As you probably noticed, Artefact use units like mm, pt... Every positions and size must be expressed with a unit and every unit can be used for anything (you can express font size with km if you want… but it's probably not a good idea! ). 

Thanks to the Units framework and its authors: 
- http://map.squeak.org/package/8664cb28-916b-4e8a-8cd6-b6db73f5024c
- http://smalltalkhub.com/MarcusDenker/Units/ 
- today hosted on https://github.com/zweidenker/Units

## Document: the world on top of four elephants

A PDFDocument is an ordered collection of pages. A document defines default values for pages and elements. By default, a document contains **A4 portrait** pages. You can change it with the *#format:* method.

```Smalltalk
PDFDocument new format: PDFA3Format new setLandscape.
```

A PDFDocument could be documented with metaData. All these data are contained in a PDFMetaData object which define following properties:
- title
- subject
- author
- keywords
- creator
- producer

```Smalltalk
PDFDocument new metaData title: 'Document title'; 
	subject: 'subject of the document'; 
	author: 'The Pasta Team'; 
	keywords: 'cool rock best';
	creator: 'Artefact - Pharo'.
```

By default Artefact generate compressed document but you can disable and generate raw documents:

```Smalltalk
PDFDocument new uncompressed
```

## Pages: no paper no trees (but lots of dead unicorns)

A page is included in a document (or more if you want to use it in many documents). By default, a page is in an A4 portrait format. You can change the format in the same way you does with document:

```Smalltalk
PDFPage new format: PDFA3Format new setLandscape.
```

You can mix multiple formats and orientations in the same document.

Like painters and poets, an empty surface is just a base to expression. From this point of view, the most useful method of the PDFPage object is probably *#add:* that allow you to write, draw or paint.

## Elements: a quill of ice and fire

A **PDFElement** is a reusable component that represent a text, an image, a geometric shape or even a complex graph or table.

There are two kinds of PDFElement:
- Simple elements inherit from **PDFBasic** (primitive operation in the pdf specification)
- Composite elements inherit from **PDFComposite** (a wrap between multiple PDFElements whether they are basic or composite)

Each PDFElement have a set of properties that define its *appearance* (text color, font, dots…). Those properties are grouped in a stylesheet owned by each element. Every element controls its own appearance and doesn't affect other (in opposition as many PDF framework that use a flow logic). This behavior allow you to move or even use in multiple pages or document the same element.

## Basic Elements (Small is beautiful)

- PDFBezierCurveElement
- PDFCircleElement
- PDFLineElement
- PDFPolygonElement
- PDFRectElement
- PDFJpegElement
- PDFPngElement
- PDFTextElement

## Composite Elements (just tape a bunch of cats together to create a horse)

The power of artefact is to avoid redefining each combination by creating high-level elements (datatable, charts, barcode...).

Instead of creating methods, Artefact offers you a way to define your composition with a standard mechanism. This context allow you to benefit from every cool stuff in artefact like stylesheet, layout, isolation and reusability.

### Composites provided by Artefact

- PDFFormattedTextElement
- PDFParagraphElement
- PDFArrowElement
- PDFDoubleArrowElement
- PDFCellElement
- PDFDataTableElement
- PDFDataTableWithColumnsCaptionElement
- PDFDataTableWithRowsCaptionElement

### Creating your own composite element

The spirit of Artefact is to reduce the complexity of pdf generation. When you have to create a document, a good idea is to avoid wasting time to reinvent the wheel.

When you create a composite element inherit from PDFComposite or PDFCompositeText if your element will be based around a String.

## Stylesheet, turn a frog into a prince without kissing

A **PDFStyleSheet** is a dictionary that map rendering properties. A default stylesheet is defined at the document level when this one is created. Consequently, you don't have to specify every values if you want a generic rendering. 
Following the hierarchy logic, a stylesheet defined at a lower level will surcharge properties. For example, if you define a *textColor* in the document stylesheet, every text will be written in that color except elements where textColor is define in their stylesheet. Like pages and elements, the same stylesheet can be used with different elements or documents.

Artefact introduce a *style context*. Every PDFElement can be associated to a specific style:

```Smalltalk
PDFText from: 10mm@15mm text: 'My title' style: #title
```

Then, at any upper level (document, page…), you can express the specific title style context:

```Smalltalk
myDocument stylesheet > #title at: #font put: PDFCourierFont size: 32 pt
```

## Fonts
	
Artefact support integrated PDF fonts (**PDFCourierFont**, **PDFHelveticaFont**, **PDFSymbolFont**, **PDFTimesFont** and **PDFZapfdingbatsFont**). These fonts are available in any PDF viewer.
A PDFFont object supports the basic style: *bold* and *italic*.

```Smalltalk
PDFText from: 10mm@15mm text: 'My title' font: ((PDFTimesFont size: 24 pt) bold: true).
```

### Dots

All the geometric shapes can use a dotted style. It is defined by a PDFDotted object that specify the length of each segment and the space between them.

```Smalltalk
((PDFArrowElement from: 125 mm @ 40 mm to:  100 mm @ 80 mm)
        drawColor: (PDFColor r: 0 g: 255 b: 0);
		dotted:
		    (PDFDotted new
			    length: 2 mm;
				space: 3 mm)).
```
