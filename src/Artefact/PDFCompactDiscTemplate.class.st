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
	self add: (PDFCircleElement new 
		from: 50 mm @ 50 mm;
		radius: 30 mm
	).
]
