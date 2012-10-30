Class {
	#name : #PDFDataTableWithColumnsCaptionStyle,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Styles'
}

{ #category : #'as yet unclassified' }
PDFDataTableWithColumnsCaptionStyle >> getStyles [ 

	| dataStartAtPos |
	
	^OrderedCollection new 
		add: (PDFDataTableStyle new 
			styleSheet: self styleSheet; 
			xy: self xy; 
			wh: self wh; 
			data: (OrderedCollection new add: self captions; yourself));
		add: (PDFDataTableStyle new
			styleSheet: self styleSheet;
			xy: self xy + (0 @ (self wh y));
			wh: self wh;
			data: self data
		);
		yourself
]
