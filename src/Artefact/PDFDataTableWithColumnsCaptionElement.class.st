Class {
	#name : #PDFDataTableWithColumnsCaptionElement,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDataTableWithColumnsCaptionElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"answer a datatable model with the captions in the columns"

	elements := self captions collect: [ :aCaption | self buildCaption: aCaption styleSheet: aStyleSheet ].
	^ OrderedCollection new
		add:
				(PDFDataTableCustomizedElement new
						styleSheet: aStyleSheet;
						from: self from;
						wh: self wh;
						data: {elements});
		add:
				(PDFDataTableElement new
						styleSheet: aStyleSheet;
						from: self from + (0 @ self wh y);
						wh: self wh;
						data: self data);
		yourself
]
