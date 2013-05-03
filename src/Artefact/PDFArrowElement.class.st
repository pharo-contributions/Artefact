"
A PDFArrowElement is the element to draw a simple arrow (with one head at the end).

Styles hierarchy:
#arrow
#arrow > #head
"
Class {
	#name : #PDFArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFArrowElement >> getSubElementsWith: aGenerator styleSheet: aStyleSheet [ 
	"answer the style description"
	
	^ {(PDFLineElement new from: self from; to: self to)}, (self headAt: self to angle: self angle)

]
