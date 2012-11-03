Class {
	#name : #PDFDataTableWithRowsCaptionStyle,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFDataTableWithRowsCaptionStyle >> getStyles [ 
 
	"answer a datatable model with the captions in the rows"
	
	1 to: (self data size) do: [ :lineNumber |
		elements add: (OrderedCollection new 
			add: (self buildCaption: (self captions at: lineNumber));
			addAll: ((self data at: lineNumber) collect: [ :aValue | self buildValue: aValue ]);
			yourself ).
	].

	^OrderedCollection new 
		add: (PDFDataTableCustomizedStyle new
			styleSheet: self styleSheet;
			xy: self xy;
			wh: self wh;
			data: elements);
			yourself

]
