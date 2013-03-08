Class {
	#name : #PDFDataTableWithRowsCaptionElement,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDataTableWithRowsCaptionElement >> getSubElementsWith: anObject styleSheet: anObject1 [ 
 
	"answer a datatable model with the captions in the rows"
	
	1 to: (self data size) do: [ :lineNumber |
		elements add: (OrderedCollection new 
			add: (self buildCaption: (self captions at: lineNumber));
			addAll: ((self data at: lineNumber) collect: [ :aValue | self buildValue: aValue ]);
			yourself ).
	].

	^OrderedCollection new 
		add: (PDFDataTableCustomizedElement new
			styleSheet: self styleSheet;
			from: self from;
			wh: self wh;
			data: elements);
			yourself

]
