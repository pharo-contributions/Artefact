Class {
	#name : #PDFColorTest,
	#superclass : #TestCase,
	#category : #'Artefact-Test'
}

{ #category : #'as yet unclassified' }
PDFColorTest >> testEqual [
	self assert: (PDFColor new setColor: #(12 48 79)) equals: (PDFColor new setColor: #(12 48 79))
]

{ #category : #'as yet unclassified' }
PDFColorTest >> testEqualDifferents [
	self deny: (PDFColor new setColor: #(54 98 12)) = (PDFColor new setColor: #(12 48 79))
]
