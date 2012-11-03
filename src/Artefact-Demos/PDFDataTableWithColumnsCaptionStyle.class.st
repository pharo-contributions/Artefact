Class {
	#name : #PDFDataTableWithColumnsCaptionStyle,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFDataTableWithColumnsCaptionStyle >> getStyles [ 
	"answer a datatable model with the captions in the columns"
	
	elements := self captions collect: [ :aCaption | self buildCaption: aCaption ].
	
	^OrderedCollection new 
		add: (PDFDataTableCustomizedStyle new
			styleSheet: self styleSheet;
			xy: self xy;
			wh: self wh;
			data: { elements } );
		add: (PDFDataTableStyle new
			styleSheet: self styleSheet;
			xy: self xy + (0 @ (self wh y));
			wh: self wh;
			data: self data
		);
		yourself

		

]
