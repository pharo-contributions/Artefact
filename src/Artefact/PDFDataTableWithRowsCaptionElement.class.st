Class {
	#name : #PDFDataTableWithRowsCaptionElement,
	#superclass : #PDFDataTableWithCaptions,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDataTableWithRowsCaptionElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"answer a datatable model with the captions in the rows"

	1 to: self data size do: [ :lineNumber | 
		elements
			add:
				(OrderedCollection new
					add: (self buildCaption: (self captions at: lineNumber) styleSheet: aStyleSheet);
					addAll: ((self data at: lineNumber) collect: [ :aValue | self buildValue: aValue ]);
					yourself) ].
	^ OrderedCollection new
		add:
				(PDFDataTableCustomizedElement new
						styleSheet: aStyleSheet;
						from: self from;
						wh: self wh;
						data: elements);
		yourself
]
