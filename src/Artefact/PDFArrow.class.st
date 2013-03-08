Class {
	#name : #PDFArrow,
	#superclass : #PDFCompositeDraw,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFArrow >> angle [
	^ ((to y - from y) convertTo: Unit point) value arcTan: ((to x - from x) convertTo: Unit point) value
]

{ #category : #action }
PDFArrow >> destinationOfHeadItem: aAngleValue with: aPosition [
	"Answer the destination of a head item"
	^(aPosition x - (self headLength * (aAngleValue cos)))@(aPosition y - (self headLength * (aAngleValue sin)))
]

{ #category : #render }
PDFArrow >> getSubElementsWith: anObject styleSheet: anObject1 [
	self subclassResponsibility
]

{ #category : #accessing }
PDFArrow >> headLength [
	"answer the length of the head of the arrow"
	^3 pt
]
