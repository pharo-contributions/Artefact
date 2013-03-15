Class {
	#name : #PDFArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFArrowElement >> getSubElementsWith: anObject styleSheet: anObject1 [ 
	"answer the style description"
	
	^ {(PDFLineElement new styleSheet: (self styleSheet); from: self from; to: self to)}, (self headAt: self to angle: self angle)

]
