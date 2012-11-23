Class {
	#name : #PDFDataTableWithColumnsCaptionElement,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDataTableWithColumnsCaptionElement >> getSubElements [ 
	"answer a datatable model with the captions in the columns"
	
	elements := self captions collect: [ :aCaption | self buildCaption: aCaption ].
	
	^OrderedCollection new 
		add: (PDFDataTableCustomizedElement new
			styleSheet: self styleSheet;
			from: self from;
			wh: self wh;
			data: { elements } );
		add: (PDFDataTableElement new
			styleSheet: self styleSheet;
			from: self from + (0 @ (self wh y));
			wh: self wh;
			data: self data
		);
		yourself

		

]
