"
A cover for DVD

"
Class {
	#name : #PDFDVDCoverTemplate,
	#superclass : #PDFTemplate,
	#category : #'Artefact-Templates'
}

{ #category : #'as yet unclassified' }
PDFDVDCoverTemplate class >> recommendedPageFormat [
	^(PDFA4Format new setLandscape)
]

{ #category : #action }
PDFDVDCoverTemplate >> drawTemplate [
	self add: (PDFRectElement new
		from: 10 mm @ 10 mm;
		wh: 272 mm @ 182 mm;
		dotted: self dotted
	).
	self add: (PDFLineElement new 
		from:139mm @ 10mm;
		to: 139mm @ 192mm;
		dotted: self dotted
	).
	self add: (PDFLineElement new 
		from:153mm @ 10mm;
		to: 153mm @ 192mm;
		dotted: self dotted
	).
]
