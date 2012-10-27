Class {
	#name : #PDFArrowStyle,
	#superclass : #PDFArrow,
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFArrowStyle >> dotted: aPDFDottedObject [
	lineElement dotted: aPDFDottedObject.
	headFirstElement dotted: aPDFDottedObject.
	headSecondElement dotted: aPDFDottedObject
]

{ #category : #accessing }
PDFArrowStyle >> drawColor: aPDFColor [
	lineElement drawColor: aPDFColor.
	headFirstElement drawColor: aPDFColor.
	headSecondElement drawColor: aPDFColor.
]

{ #category : #render }
PDFArrowStyle >> getStyles [ 
	"answer the style description"
	
	^ OrderedCollection new
		add: (lineElement xy: self xy; destination: self destination);
		add: (headFirstElement xy: self destination; destination: (self destinationOfHeadItem: (self angle - ((Float pi) / 6)) with: self destination));
		add: (headSecondElement xy: self destination; destination: (self destinationOfHeadItem: (self angle + ((Float pi) / 6)) with: self destination));
		yourself.

]

{ #category : #'initialize-release' }
PDFArrowStyle >> initialize [ 
	super initialize.
	
	lineElement := PDFLineStyle new.
	headFirstElement := PDFLineStyle new.
	headSecondElement := PDFLineStyle new.
]

{ #category : #accessing }
PDFArrowStyle >> thickness: aThickness [
	lineElement thickness: aThickness.
	headFirstElement thickness: aThickness.
	headSecondElement thickness: aThickness.
]
