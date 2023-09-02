Class {
	#name : #PDFLayoutTest,
	#superclass : #TestCase,
	#instVars : [
		'testLayout',
		'generator',
		'page',
		'document'
	],
	#category : #'Artefact-Core-Tests-Elements'
}

{ #category : #running }
PDFLayoutTest >> setUp [
	testLayout := PDFDummyLayout new.
	generator := PDFGenerator new.
	page := PDFPage new.
	document := PDFDocument new.
	document add: page.
	generator currentPage: page
]

{ #category : #tests }
PDFLayoutTest >> testLayoutDoNotLoseOriginalDimensionOfElements [
	| rect rect2 |
	rect := PDFRectElement from: 10 mm @ 10 mm dimension: 10 cm @ 3 cm.
	rect2 := PDFRectElement from: 50 mm @ 15 mm dimension: 24 mm @ 56 mm.
	testLayout
		from: 34 mm @ 78 mm;
		add: rect;
		add: rect2.
	testLayout generateCodeSegmentsCollectionWith: generator styleSheet: StyleSheet default format: (PDFA4Format new).
	self assert: rect dimension equals: 10 cm @ 3 cm.
	self assert: rect2 dimension equals: 24 mm @ 56 mm
]
