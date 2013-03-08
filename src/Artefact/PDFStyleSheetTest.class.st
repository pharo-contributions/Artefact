Class {
	#name : #PDFStyleSheetTest,
	#superclass : #TestCase,
	#category : #'Artefact-Test'
}

{ #category : #'as yet unclassified' }
PDFStyleSheetTest >> testAdditionDoNotModifyFirstStyleSheet [
	| first second result |
	first := PDFStyleSheet new.
	first textColor: (PDFColor new setColor: #(0 128 255)).
	second := PDFStyleSheet new.
	second textColor: (PDFColor new setColor: #(0 12 24)).
	result := first + second.
	self assert: (first get: #textColor) equals: (PDFColor new setColor: #(0 128 255)).
	self assert: (second get: #textColor) equals: (PDFColor new setColor: #(0 12 24)).
	self assert: (result get: #textColor) equals: (PDFColor new setColor: #(0 12 24))
]
