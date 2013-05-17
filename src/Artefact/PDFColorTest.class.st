Class {
	#name : #PDFColorTest,
	#superclass : #TestCase,
	#category : #'Artefact-Test'
}

{ #category : #'as yet unclassified' }
PDFColorTest >> testEqual [
	self assert: (PDFColor r: 12 g: 48 b: 79) equals: (PDFColor r: 12 g: 48 b: 79)
]

{ #category : #'as yet unclassified' }
PDFColorTest >> testEqualDifferents [
	self deny: (PDFColor r: 54 g: 98 b: 12) = (PDFColor r: 12 g: 48 b: 79)
]
