"
A PDFTemplate is a kind of page containing pre-defined elements.

Instance Variables
	dotted:		<Object>

dotted
	- xxxxx

"
Class {
	#name : #PDFTemplate,
	#superclass : #PDFPage,
	#instVars : [
		'dotted'
	],
	#category : #'Artefact-Core-Base'
}

{ #category : #'as yet unclassified' }
PDFTemplate class >> recommendedDocumentFormat [
	self subclassResponsibility 
]

{ #category : #accessing }
PDFTemplate >> dotted [
	^dotted
]

{ #category : #accessing }
PDFTemplate >> dotted: aPDFDotted [
	dotted :=  aPDFDotted
]

{ #category : #action }
PDFTemplate >> drawTemplate [
	self subclassResponsibility 
]

{ #category : #'initialize-release' }
PDFTemplate >> initialize [
	super initialize.

	self dotted: (PDFDotted new length: 1 mm; space: 1 mm).
	self drawTemplate.	

]
