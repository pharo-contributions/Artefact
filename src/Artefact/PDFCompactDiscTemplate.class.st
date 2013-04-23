"
A cover for compact disc

"
Class {
	#name : #PDFCompactDiscTemplate,
	#superclass : #PDFTemplate,
	#category : #'Artefact-Templates'
}

{ #category : #action }
PDFCompactDiscTemplate >> drawTemplate [
	self add: (PDFRectElement new
		from: 10 mm @ 10 mm;
		wh: 240 mm @ 120 mm;
		dotted: self dotted
	).
	self add: (PDFLineElement new 
		from: 130mm @ 10mm;
		to: 130mm @ 130mm;
		dotted: self dotted
	).
]
