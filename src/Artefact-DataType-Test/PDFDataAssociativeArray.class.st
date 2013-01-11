Class {
	#name : #PDFDataAssociativeArray,
	#superclass : #PDFDataType,
	#instVars : [
		'associativeArray'
	],
	#category : #'Artefact-DataType'
}

{ #category : #accessing }
PDFDataAssociativeArray >> add: aPDFDataCouple [
	associativeArray add: aPDFDataCouple
]

{ #category : #accessing }
PDFDataAssociativeArray >> associativeArray [
	^ associativeArray
]

{ #category : #accessing }
PDFDataAssociativeArray >> associativeArray: anObject [
	associativeArray := anObject
]

{ #category : #'initialize-release' }
PDFDataAssociativeArray >> initialize [ 
	associativeArray := OrderedCollection new
]

{ #category : #printing }
PDFDataAssociativeArray >> printOn: aStream [
	aStream nextPutAll: '<<'; crlf.
	associativeArray do: 
		[:aCouple | 
			aCouple printOn: aStream. 
			aStream crlf ].
	aStream nextPutAll: '>>'
]
