Class {
	#name : #PDFArrowStyle,
	#superclass : #PDFArrow,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFArrowStyle >> getStyles [ 
	"answer the style description"
	
	^ OrderedCollection new
		add: (PDFLineStyle new styleSheet: (self styleSheet); xy: self xy; destination: self destination);
		add: (PDFLineStyle new styleSheet: (self styleSheet); xy: self destination; destination: (self destinationOfHeadItem: (self angle - ((Float pi) / 6)) with: self destination));
		add: (PDFLineStyle new styleSheet: (self styleSheet); xy: self destination; destination: (self destinationOfHeadItem: (self angle + ((Float pi) / 6)) with: self destination));
		yourself.

]
