"
A PDFDoubleArrowElement is the element to draw a double arrow (with one head at each extremity).

Styles hierarchy:
#arrow
#arrow > #head


"
Class {
	#name : #PDFDoubleArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDoubleArrowElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"answer the style description"

	^ {(PDFLineElement new
		from: self from;
		to: self to)} , (self headAt: self to angle: self angle) , (self headAt: self from angle: self angle - Float pi)
]
