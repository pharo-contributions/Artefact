Class {
	#name : #PDFDataAssociativeArray,
	#superclass : #PDFDataType,
	#instVars : [
		'associativeArray'
	],
	#category : #'Artefact-DataType'
}

{ #category : #accessing }
PDFDataAssociativeArray >> associativeArray [
	^ associativeArray
]

{ #category : #accessing }
PDFDataAssociativeArray >> associativeArray: anObject [
	associativeArray := anObject
]

{ #category : #'as yet unclassified' }
PDFDataAssociativeArray >> at: aKey put: aValue [
	associativeArray at: aKey put: aValue
]

{ #category : #'as yet unclassified' }
PDFDataAssociativeArray >> initialize [ 
	associativeArray := Dictionary new
]

{ #category : #'as yet unclassified' }
PDFDataAssociativeArray >> printOn: aStream [
	aStream nextPutAll: '<<'; crlf.
	associativeArray keysAndValuesDo: 
		[:aKey :aValue | 
			aKey printOn: aStream. 
			aStream space. 
			aValue printOn: aStream.
			aStream crlf ].
	aStream nextPutAll: '>>'
]
