"
A PDFHorizontalLayout is a layout capable to display elements horizontally.

Instance Variables

"
Class {
	#name : #PDFHorizontalLayout,
	#superclass : #PDFSpacedLayout,
	#category : #'Artefact-Elements-Layouts'
}

{ #category : #'as yet unclassified' }
PDFHorizontalLayout >> defineElementPosition: anElement with: aPDFGenerator styleSheet: aStyleSheet [
	| previousElement |
	anElement
		from:
			(self elements first = anElement
				ifTrue: [ self from ]
				ifFalse: [ 
					previousElement := self elements before: anElement.
					previousElement from + ((previousElement wh x + self spacing) @ 0 pt) ])
]
