Class {
	#name : #PDFArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFArrowElement >> getSubElementsWith: anObject styleSheet: anObject1 [ 
	"answer the style description"
	
	^ OrderedCollection new
		add: (PDFLineElement new styleSheet: (self styleSheet); from: self from; to: self to);
		add: (PDFLineElement new styleSheet: (self styleSheet); from: self to; to: (self destinationOfHeadItem: (self angle - ((Float pi) / 6)) with: self to));
		add: (PDFLineElement new styleSheet: (self styleSheet); from: self to; to: (self destinationOfHeadItem: (self angle + ((Float pi) / 6)) with: self to));
		yourself.

]
