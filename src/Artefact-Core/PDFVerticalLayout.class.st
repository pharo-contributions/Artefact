"
A PDFVerticalLayout is a layout capable to display elements vertically.

Instance Variables

"
Class {
	#name : #PDFVerticalLayout,
	#superclass : #PDFSpacedLayout,
	#category : #'Artefact-Core-Layouts'
}

{ #category : #layouting }
PDFVerticalLayout >> defineElementPosition: anElement with: aPDFGenerator styleSheet: aStyleSheet [
	| previousElement |
	anElement
		from:
			(self elements first = anElement
				ifTrue: [ self from ]
				ifFalse: [ 
					previousElement := self elements before: anElement.
					previousElement from + (0 pt @ (previousElement dimension y + self spacing)) ])
]
