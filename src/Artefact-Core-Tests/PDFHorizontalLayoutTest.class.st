Class {
	#name : #PDFHorizontalLayoutTest,
	#superclass : #TestCase,
	#instVars : [
		'testLayout'
	],
	#category : #'Artefact-Core-Tests-Layouts'
}

{ #category : #running }
PDFHorizontalLayoutTest >> setUp [ 
	testLayout := PDFHorizontalLayout new
]

{ #category : #tests }
PDFHorizontalLayoutTest >> testPosition [
	| rect line |
	rect := PDFRectElement from: 10 mm @ 10 mm dimension: 10 cm @ 3 cm.
	line := PDFLineElement from: 50 mm @ 15 mm dimension: 24 mm @ 56 mm.
	testLayout
		from: 34 mm @ 78 mm;
		add: rect;
		add: line.
	testLayout defineElementPosition: rect with: nil styleSheet: nil.
	testLayout defineElementPosition: line with: nil styleSheet: nil.
	self assert: rect from equals: 34 mm @ 78 mm.
	self assert: line from equals: (34 mm + 10 cm + testLayout spacing) @ 78 mm
]
