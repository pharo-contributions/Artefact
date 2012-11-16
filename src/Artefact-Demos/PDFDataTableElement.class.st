Class {
	#name : #PDFDataTableElement,
	#superclass : #PDFDataTable,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDataTableElement >> getStyles [ 
	"answer a model of a datatable"
	
	self data do: [ :aLine |
		elements add: (aLine collect: [ :aValue | self buildValue: aValue ]).
	].
	
	^{ PDFDataTableCustomizedElement new
		styleSheet: (self styleSheet);
		xy: (self xy);
		wh: (self wh);
		data: elements }
		
]
