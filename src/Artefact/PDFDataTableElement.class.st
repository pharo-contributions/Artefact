"
A PDFDataTableElement is a basic datatable without caption. All cells are identicals.
"
Class {
	#name : #PDFDataTableElement,
	#superclass : #PDFDataTableOld,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDataTableElement >> getSubElementsWith: anObject styleSheet: aStyleSheet [ 
	"answer a model of a datatable"
	
	self data do: [ :aLine |
		elements add: (aLine collect: [ :aValue | self buildValue: aValue ]).
	].
	
	^{ PDFDataTableCustomizedElement new
		from: (self from);
		wh: (self wh);
		data: elements }
		
]
