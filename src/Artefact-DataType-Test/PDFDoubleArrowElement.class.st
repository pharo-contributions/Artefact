Class {
	#name : #PDFDoubleArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Elements-Page-Composites'
}

{ #category : #action }
PDFDoubleArrowElement >> angle [
	"In this method, origin and destination are inversed"
	^(from y - to y) arcTan: (from x - to x)
]

{ #category : #render }
PDFDoubleArrowElement >> getSubElements [ 
	"answer the style description"
	
	^ OrderedCollection new
		add: (PDFArrowElement new styleSheet: (self styleSheet); from: self from; to: self to);
		add: (PDFLineElement new styleSheet: (self styleSheet); from: self from; to: (self destinationOfHeadItem: (self angle - ((Float pi) / 6)) with: self from));
		add: (PDFLineElement new styleSheet: (self styleSheet); from: self from; to: (self destinationOfHeadItem: (self angle + ((Float pi) / 6)) with: self from));
		yourself.
]
