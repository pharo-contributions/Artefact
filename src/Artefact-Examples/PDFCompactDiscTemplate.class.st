"
A cover for compact disc

"
Class {
	#name : #PDFCompactDiscTemplate,
	#superclass : #PDFTemplate,
	#category : #'Artefact-Examples-Demos-Templates'
}

{ #category : #accessing }
PDFCompactDiscTemplate class >> recommendedPageFormat [
	^(PDFA4Format new setLandscape)
]

{ #category : #action }
PDFCompactDiscTemplate >> drawTemplate [
	self add: ((PDFRectElement 
		from: 10 mm @ 10 mm
		dimension: 240 mm @ 120 mm)
		dotted: self dotted
	).
	self add: ((PDFLineElement  
		from: 130mm @ 10mm
		to: 130mm @ 130mm)
		dotted: self dotted
	).
]
