Class {
	#name : #PDFDataTableCustomizedStyle,
	#superclass : #PDFDataTable,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFDataTableCustomizedStyle >> getStyles [ 
	"answer a view of a datatable"
	
	| position |
	
	position := self xy.
	
	self data do: [ :line |
		line do: [ :cell | 
			elements add: (cell xy: position; wh: self wh).
			position := ((position x) + (self wh x)) @ position y.
		].
		position := (self xy x) @ (position y + self wh y).
	].
	
	 ^elements
]
