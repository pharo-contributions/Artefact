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
	
	^ {(PDFLineElement from: self orientedFrom to: self orientedTo)}, (self headAt: self orientedTo angle: self angle)

]
