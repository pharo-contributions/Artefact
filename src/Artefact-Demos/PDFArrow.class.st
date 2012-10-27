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
PDFArrow >> angle [
	^(destination y - xy y) arcTan: (destination x - xy x)
]

{ #category : #action }
PDFArrow >> destinationOfHeadItem: aAngleValue with: aPosition [
	"Answer the destination of a head item"
	^(aPosition x - (self headLength * (aAngleValue cos)))@(aPosition y - (self headLength * (aAngleValue sin)))
]

{ #category : #accessing }
PDFArrow >> dotted: aPDFDottedObject [
	self subclassResponsibility
]

{ #category : #accessing }
PDFArrow >> drawColor: aPDFColor [
	self subclassResponsibility
]

{ #category : #render }
PDFArrow >> getStyles [
	self subclassResponsibility
]

{ #category : #accessing }
PDFArrow >> headLength [
	"answer the length of the head of the arrow"
	^3
]

{ #category : #'initialize-release' }
PDFArrow >> initialize [
	super initialize.
	

]

{ #category : #accessing }
PDFArrow >> thickness: aThickness [
	self subclassResponsibility
]
