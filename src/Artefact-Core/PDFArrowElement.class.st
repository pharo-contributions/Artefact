"
A PDFArrowElement is the element to draw a simple arrow (with one head at the end). An arrow MUST be created with the from:to: method on class side (to determine orientation).

Styles hierarchy:
#arrow
#arrow > #head
"
Class {
	#name : #PDFArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Core-Elements-Composites'
}

{ #category : #render }
PDFArrowElement >> getSubElementsWith: aGenerator styleSheet: aStyleSheet [ 
	"answer the style description"
	
	^ {(PDFLineElement from: self orientedFrom to: self orientedTo)}, (self headAt: self orientedTo angle: self angle)

]
