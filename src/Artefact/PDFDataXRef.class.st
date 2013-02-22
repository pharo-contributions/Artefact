Class {
	#name : #PDFDataXRef,
	#superclass : #PDFDataType,
	#instVars : [
		'referencies'
	],
	#category : #'Artefact-DataType'
}

{ #category : #accessing }
PDFDataXRef >> AddReferenceTo: aPDFDataObject [
	referencies addLast: (PDFDataXRefEntry referencedObject: aPDFDataObject)
]

{ #category : #'as yet unclassified' }
PDFDataXRef >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataXRef: self
]

{ #category : #'as yet unclassified' }
PDFDataXRef >> initialize [
	referencies := OrderedCollection new.
	referencies add: PDFDataXRefEntry new.
]

{ #category : #accessing }
PDFDataXRef >> referencies [
	^ referencies
]

{ #category : #accessing }
PDFDataXRef >> referencies: anObject [
	referencies := anObject
]
