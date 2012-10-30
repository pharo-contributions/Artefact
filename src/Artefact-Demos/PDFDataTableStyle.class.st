Class {
	#name : #PDFDataTableStyle,
	#superclass : #PDFDataTable,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFDataTableStyle >> getStyles [ 
	"answer a representation of a datatable"
	
	| position |
	
	position := self xy.
	
	self data do: [ :line |
		line do: [ :value | 
			elements add: (PDFCellStyle new 
				xy: position; 
				wh: self wh; 
				styleSheet: (self styleSheet); 
				text: value).
			position := ((position x) + (self wh x)) @ position y.
		].
		position := (self xy x) @ (position y + self wh y).
	].
	
	 ^elements

]
