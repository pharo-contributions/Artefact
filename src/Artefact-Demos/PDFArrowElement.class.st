Class {
	#name : #PDFArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFArrowElement >> getStyles [ 
	"answer the style description"
	
	^ OrderedCollection new
		add: (PDFLineElement new styleSheet: (self styleSheet); xy: self xy; destination: self destination);
		add: (PDFLineElement new styleSheet: (self styleSheet); xy: self destination; destination: (self destinationOfHeadItem: (self angle - ((Float pi) / 6)) with: self destination));
		add: (PDFLineElement new styleSheet: (self styleSheet); xy: self destination; destination: (self destinationOfHeadItem: (self angle + ((Float pi) / 6)) with: self destination));
		yourself.

]
