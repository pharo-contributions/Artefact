Class {
	#name : #PDFDataType,
	#superclass : #Object,
	#category : #'Artefact-DataType'
}

{ #category : #visit }
PDFDataType >> acceptVisitor: aVisitor [
	^ self subclassResponsibility 
]

{ #category : #visit }
PDFDataType >> isPrintable [
	^ false
]
