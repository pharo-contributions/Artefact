Class {
	#name : #PDFLayoutTest,
	#superclass : #TestCase,
	#instVars : [
		'testLayout',
		'generator',
		'page',
		'document'
	],
	#category : #'Artefact-Elements-Test'
}

{ #category : #'as yet unclassified' }
PDFLayoutTest >> setUp [ 
	testLayout := PDFDummyLayout new.
	generator := PDFGenerator new.
	page := PDFPage new.
	document := PDFDocument new.
	document add: page.
	generator currentPage: page.
]

{ #category : #'as yet unclassified' }
PDFLayoutTest >> testLayoutDoNotLoseOriginalDimensionOfElements [
	| rect rect2 |
	rect := PDFRectElement from: 10 mm @ 10 mm wh: 10 cm @ 3 cm.
	rect2 := PDFRectElement from: 50 mm @ 15 mm wh: 24 mm @ 56 mm.
	testLayout
		from: 34 mm @ 78 mm;
		add: rect;
		add: rect2.
	testLayout generateCodeSegmentsCollectionWith: generator styleSheet: PDFStyleSheet default.
	self assert: rect wh equals: 10 cm @ 3 cm.
	self assert: rect2 wh equals: 24 mm @ 56 mm
]
