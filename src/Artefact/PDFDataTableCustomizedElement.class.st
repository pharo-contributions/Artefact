"
A PDFDataTableCustomizedElement is a datatable where each cell could receive it own style.

"
Class {
	#name : #PDFDataTableCustomizedElement,
	#superclass : #PDFDataTableOld,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDataTableCustomizedElement >> getSubElementsWith: anObject styleSheet: aStyleSheet [ 
	"answer a view of a datatable"
	
	| position |
	
	position := self from.
	
	self data do: [ :line |
		line do: [ :cell | 
			elements add: (cell from: position; wh: self wh).
			position := ((position x) + (self wh x)) @ position y.
		].
		position := (self from x) @ (position y + self wh y).
	].
	
	 ^elements
]
