Class {
	#name : #PDFDoubleArrowStyle,
	#superclass : #PDFArrow,
	#category : #'Artefact-Styles'
}

{ #category : #action }
PDFDoubleArrowStyle >> angle [
	"In this method, origin and destination are inversed"
	^(xy y - destination y) arcTan: (xy x - destination x)
]

{ #category : #render }
PDFDoubleArrowStyle >> getStyles [ 
	"answer the style description"
	
	^ OrderedCollection new
		add: (PDFArrowStyle new styleSheet: (self styleSheet); xy: self xy; destination: self destination);
		add: (PDFLineStyle new styleSheet: (self styleSheet); xy: self xy; destination: (self destinationOfHeadItem: (self angle - ((Float pi) / 6)) with: self xy));
		add: (PDFLineStyle new styleSheet: (self styleSheet); xy: self xy; destination: (self destinationOfHeadItem: (self angle + ((Float pi) / 6)) with: self xy));
		yourself.
]
