Class {
	#name : #PDFDoubleArrowElement,
	#superclass : #PDFArrow,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFDoubleArrowElement >> angle [
	"In this method, origin and destination are inversed"
	^(from y - to y) arcTan: (from x - to x)
]

{ #category : #render }
PDFDoubleArrowElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"answer the style description"

	^ OrderedCollection new
		add:
				(PDFArrowElement new
						styleSheet: aStyleSheet;
						from: (self from + self to) / 2;
						to: self to);
		add:
				(PDFArrowElement new
						styleSheet: aStyleSheet;
						from: (self from + self to) / 2;
						to: self from);
		yourself
]
