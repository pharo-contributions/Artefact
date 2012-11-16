Class {
	#name : #PDFDoubleArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Elements'
}

{ #category : #action }
PDFDoubleArrowElement >> angle [
	"In this method, origin and destination are inversed"
	^(xy y - destination y) arcTan: (xy x - destination x)
]

{ #category : #render }
PDFDoubleArrowElement >> getStyles [ 
	"answer the style description"
	
	^ OrderedCollection new
		add: (PDFArrowElement new styleSheet: (self styleSheet); xy: self xy; destination: self destination);
		add: (PDFLineElement new styleSheet: (self styleSheet); xy: self xy; destination: (self destinationOfHeadItem: (self angle - ((Float pi) / 6)) with: self xy));
		add: (PDFLineElement new styleSheet: (self styleSheet); xy: self xy; destination: (self destinationOfHeadItem: (self angle + ((Float pi) / 6)) with: self xy));
		yourself.
]
