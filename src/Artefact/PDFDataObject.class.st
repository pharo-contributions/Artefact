Class {
	#name : #PDFDataObject,
	#superclass : #PDFDataType,
	#instVars : [
		'id',
		'revision',
		'contents'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataObject >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataObject: self
]

{ #category : #'as yet unclassified' }
PDFDataObject >> addContent: aContent [
	contents addLast: aContent
]

{ #category : #accessing }
PDFDataObject >> contents [
	^ contents
]

{ #category : #accessing }
PDFDataObject >> contents: anObject [
	contents := anObject
]

{ #category : #accessing }
PDFDataObject >> id [
	^ id
]

{ #category : #accessing }
PDFDataObject >> id: anObject [
	id := anObject
]

{ #category : #'initialize-release' }
PDFDataObject >> initialize [ 
	contents := OrderedCollection new
]

{ #category : #accessing }
PDFDataObject >> printOn: aStream [
	aStream nextPutAll: id asString; space; nextPutAll: revision asString; space; nextPutAll: 'obj'; crlf.
	contents do: [:aContent | aContent printOn: aStream. aStream crlf].
	aStream nextPutAll: 'endobj'
]

{ #category : #accessing }
PDFDataObject >> revision [
	^ revision
]

{ #category : #accessing }
PDFDataObject >> revision: anObject [
	revision := anObject
]
