"
A PDFDataObject is the representation for objects in PDF.

Instance Variables
	contents:		<Object>
	id:		<Object>
	revision:		<Object>

contents
	- xxxxx

id
	- xxxxx

revision
	- xxxxx

"
Class {
	#name : #PDFDataObject,
	#superclass : #PDFDataType,
	#instVars : [
		'id',
		'revision',
		'contents'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #visit }
PDFDataObject >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataObject: self
]

{ #category : #accessing }
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
	aStream nextPutAll: id asString; space; nextPutAll: revision asString; space; nextPutAll: 'obj'; lf.
	contents do: [:aContent | aContent printOn: aStream. aStream lf].
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
