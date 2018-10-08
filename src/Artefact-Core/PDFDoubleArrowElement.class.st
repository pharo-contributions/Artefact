"
A PDFDoubleArrowElement is the element to draw a double arrow (with one head at each extremity). An arrow MUST be created with the from:to: method on class side (to determine orientation)

Styles hierarchy:
#arrow
#arrow > #head


"
Class {
	#name : #PDFDoubleArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Core-Elements-Composites'
}

{ #category : #render }
PDFDoubleArrowElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"answer the style description"

	^ {(PDFLineElement 
		from: self orientedFrom
		to: self orientedTo)} , (self headAt: self orientedTo angle: self angle) , (self headAt: self orientedFrom angle: self angle - Float pi)
]
