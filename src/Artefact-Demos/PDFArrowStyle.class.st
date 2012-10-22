Class {
	#name : #PDFArrowStyle,
	#superclass : #PDFCompositeDrawStyle,
	#instVars : [
		'lineElement',
		'headFirstElement',
		'headSecondElement'
	],
	#category : #'Artefact-Styles'
}

{ #category : #'initialize-release' }
PDFArrowStyle >> drawColor: aPDFColor [
	lineElement drawColor: aPDFColor.
	headFirstElement drawColor: aPDFColor.
	headSecondElement drawColor: aPDFColor.	
]

{ #category : #render }
PDFArrowStyle >> getStyles [ 
	| ink headlen dxy angle angleValue  |
	
	headlen := 3.
	dxy := (destination x - xy x)@(destination y - xy y).
	angle :=  (dxy y) arcTan: dxy x.
	
	lineElement xy: self xy; destination: self destination.

	angleValue := angle - ((Float pi) / 6).
	headFirstElement xy: self destination; destination: (self destination x - (headlen * (angleValue cos)))@(self destination y - (headlen * (angleValue sin))).
	
	angleValue := angle + ((Float pi) / 6). 
	headSecondElement xy: self destination; destination: (self destination x - (headlen * (angleValue cos)))@(self destination y - (headlen * (angleValue sin))).

	"answer the style description"	
	 ^ OrderedCollection new 
		add: lineElement;
		add: headFirstElement;
		add: headSecondElement;
		yourself.

]

{ #category : #'initialize-release' }
PDFArrowStyle >> initialize [
	super initialize.
	lineElement := PDFLineStyle new.
	headFirstElement := PDFLineStyle new.
	headSecondElement := PDFLineStyle new.
]
