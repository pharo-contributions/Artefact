Class {
	#name : #PDFDataTableStyle,
	#superclass : #PDFDataTable,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFDataTableStyle >> getStyles [ 
	"answer a model of a datatable"
	
	self data do: [ :aLine |
		elements add: (aLine collect: [ :aValue | self buildValue: aValue ]).
	].
	
	^{ PDFDataTableCustomizedStyle new
		styleSheet: (self styleSheet);
		xy: (self xy);
		wh: (self wh);
		data: elements }
		
]
