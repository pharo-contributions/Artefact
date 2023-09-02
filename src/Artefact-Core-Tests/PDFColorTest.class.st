Class {
	#name : #PDFColorTest,
	#superclass : #TestCase,
	#category : #'Artefact-Core-Tests-Base'
}

{ #category : #tests }
PDFColorTest >> testEqual [
	self assert: (PDFColor r: 12 g: 48 b: 79) equals: (PDFColor r: 12 g: 48 b: 79)
]

{ #category : #tests }
PDFColorTest >> testEqualDifferents [
	self deny: (PDFColor r: 54 g: 98 b: 12) = (PDFColor r: 12 g: 48 b: 79)
]
