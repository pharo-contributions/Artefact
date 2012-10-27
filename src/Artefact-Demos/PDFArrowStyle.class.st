Class {
	#name : #PDFArrowStyle,
	#superclass : #PDFArrow,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFArrowStyle >> getStyles [ 
	| ink headlen dxy angle  |
	
	headlen := 3.
	dxy := (destination x - xy x)@(destination y - xy y).
	angle :=  (dxy y) arcTan: dxy x.
	
	lineElement 
		xy: self xy; 
		destination: self destination.

	headFirstElement 
		xy: self destination; 
		destination: (self destinationOfHeadItem: (angle - ((Float pi) / 6)) headLen: headlen).
	 
	headSecondElement 
		xy: self destination; 
		destination: (self destinationOfHeadItem: (angle + ((Float pi) / 6)) headLen: headlen).

	"answer the style description"	
	 ^ OrderedCollection new 
		add: lineElement;
		add: headFirstElement;
		add: headSecondElement;
		yourself.

]
