Class {
	#name : #PDFArrow,
	#superclass : #PDFCompositeDraw,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFArrow >> angle [
	^(to y - from y) arcTan: (to x - from x)
]

{ #category : #action }
PDFArrow >> destinationOfHeadItem: aAngleValue with: aPosition [
	"Answer the destination of a head item"
	^(aPosition x - (self headLength * (aAngleValue cos)))@(aPosition y - (self headLength * (aAngleValue sin)))
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
