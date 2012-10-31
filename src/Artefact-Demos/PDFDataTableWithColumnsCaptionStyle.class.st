Class {
	#name : #PDFDataTableWithColumnsCaptionStyle,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Styles'
}

{ #category : #'as yet unclassified' }
PDFDataTableWithColumnsCaptionStyle >> getStyles [ 

	| dataStartAtPos ink background|
	
	ink := self textColorIfAbsent: (self page styleSheet).
	background := self fillColorIfAbsent: (self page styleSheet).
	
	^OrderedCollection new 
		add: (PDFDataTableStyle new 
			styleSheet: (self styleSheet copy); 
			xy: self xy; 
			wh: self wh; 
			textColor: background;
			fillColor: ink;
			data: (OrderedCollection new add: self captions; yourself));
		add: (PDFDataTableStyle new
			styleSheet: self styleSheet;
			xy: self xy + (0 @ (self wh y));
			wh: self wh;
			data: self data
		);
		yourself
]
