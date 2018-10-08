"
A PDFArrow is the superclass for arrows (not directly usable).

"
Class {
	#name : #PDFArrow,
	#superclass : #PDFComposite,
	#traits : 'PDFAngleDirected',
	#classTraits : 'PDFAngleDirected classTrait',
	#category : #'Artefact-Core-Elements-Composites'
}

{ #category : #'as yet unclassified' }
PDFArrow class >> from: from angle: angle length: aLength [
	^ self from: from to: from + ((angle cos * aLength) @ ((angle sin * aLength) negated))
]

{ #category : #action }
PDFArrow >> angle [
	^ ((self orientedTo  y - self orientedFrom y) convertTo: Unit point) value arcTan: ((self orientedTo x - self orientedFrom x) convertTo: Unit point) value
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
	^ {(PDFLineElement
		from: aPosition
		to: (self destinationOfHeadItem: anAngle - (Float pi / 6) with: aPosition)
		style: #head).
	(PDFLineElement from: aPosition to: (self destinationOfHeadItem: anAngle + (Float pi / 6) with: aPosition) style: #head)}
]

{ #category : #accessing }
PDFArrow >> headLength [
	"answer the length of the head of the arrow"
	^3 pt
]

{ #category : #checking }
PDFArrow >> requiredAttributes [
	^ #( from to orientation )
]
