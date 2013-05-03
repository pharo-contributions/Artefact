"
A PDFArrow is the superclass for arrows (not directly usable).

"
Class {
	#name : #PDFArrow,
	#superclass : #PDFCompositeDraw,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFArrow >> angle [
	^ ((to y - from y) convertTo: Unit point) value arcTan: ((to x - from x) convertTo: Unit point) value
]

{ #category : #'initialize-release' }
PDFArrow >> defaultStyle [
	^ #arrow
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

{ #category : #action }
PDFArrow >> headAt: aPosition angle: anAngle [
	^ {(PDFLineElement new
		from: aPosition;
		to: (self destinationOfHeadItem: anAngle - (Float pi / 6) with: aPosition);
		style: #head).
	(PDFLineElement new
		from: aPosition;
		to: (self destinationOfHeadItem: anAngle + (Float pi / 6) with: aPosition);
		style: #head)}
]

{ #category : #accessing }
PDFArrow >> headLength [
	"answer the length of the head of the arrow"
	^3 pt
]
