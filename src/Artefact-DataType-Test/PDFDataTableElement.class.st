Class {
	#name : #PDFDataTableElement,
	#superclass : #PDFDataTable,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDataTableElement >> getSubElements [ 
	"answer a model of a datatable"
	
	self data do: [ :aLine |
		elements add: (aLine collect: [ :aValue | self buildValue: aValue ]).
	].
	
	^{ PDFDataTableCustomizedElement new
		styleSheet: (self styleSheet);
		from: (self from);
		wh: (self wh);
		data: elements }
		
]
