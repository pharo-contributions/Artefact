Class {
	#name : #PDFArrow,
	#superclass : #PDFCompositeDraw,
	#instVars : [
		'lineElement',
		'headFirstElement',
		'headSecondElement'
	],
	#category : #'Artefact-Styles'
}

{ #category : #action }
PDFArrow >> destinationOfHeadItem: aAngleValue headLen: aHeadLenValue [
	"Answer the destination of a head item"
	^(self destination x - (aHeadLenValue * (aAngleValue cos)))@(self destination y - (aHeadLenValue * (aAngleValue sin)))
]

{ #category : #accessing }
PDFArrow >> dotted: aPDFDottedObject [
	lineElement dotted: aPDFDottedObject.
	headFirstElement dotted: aPDFDottedObject.
	headSecondElement dotted: aPDFDottedObject
]

{ #category : #accessing }
PDFArrow >> drawColor: aPDFColor [
	lineElement drawColor: aPDFColor.
	headFirstElement drawColor: aPDFColor.
	headSecondElement drawColor: aPDFColor.	
]

{ #category : #render }
PDFArrow >> getStyles [
	self subclassResponsibility
]

{ #category : #'initialize-release' }
PDFArrow >> initialize [
	super initialize.
	lineElement := PDFLineStyle new.
	headFirstElement := PDFLineStyle new.
	headSecondElement := PDFLineStyle new.
]

{ #category : #accessing }
PDFArrow >> thickness: aThickness [
	lineElement thickness: aThickness.
	headFirstElement thickness: aThickness.
	headSecondElement thickness: aThickness.
]
