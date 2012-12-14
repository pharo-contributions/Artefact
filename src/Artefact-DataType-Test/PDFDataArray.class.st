Class {
	#name : #PDFDataArray,
	#superclass : #PDFDataType,
	#instVars : [
		'elements'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataArray >> addElement: anElement [
	elements addLast: anElement 
]

{ #category : #'as yet unclassified' }
PDFDataArray >> initialize [ 
	elements := OrderedCollection new
]

{ #category : #'as yet unclassified' }
PDFDataArray >> printOn: aStream [
	aStream nextPut: $[; space.
	elements do: [:anElement | anElement printOn: aStream. aStream space].
	aStream nextPut: $]
]
