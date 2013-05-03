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

{ #category : #'as yet unclassified' }
PDFStyleSheetTest >> testSubstyleAttributes [
	| base |
	base := PDFStyleSheet new.
	base at: #textColor put: (PDFColor new setColor: #(255 0 0)).
	base > #sub at: #textColor put: (PDFColor new setColor: #(0 255 0)).
	base > #sub > #subsub at: #textColor put: (PDFColor new setColor: #(0 0 255)).
	self assert:( base get: #textColor ) equals: (PDFColor new setColor:#(255 0 0)).
	self assert:( base > #sub get: #textColor ) equals: (PDFColor new setColor:#(0 255 0)).
	self assert:( base > #sub > #subsub get: #textColor ) equals: (PDFColor new setColor:#(0 0 255)).
]

{ #category : #'as yet unclassified' }
PDFStyleSheetTest >> testSubstyleCreation [
	| base sub |
	base := PDFStyleSheet new.
	sub := base > #sub.
	self assert: sub equals: base > #sub
]
