Class {
	#name : #PDFCodeSegment,
	#superclass : #Object,
	#instVars : [
		'styleSheet',
		'isDrawElement',
		'wh'
	],
	#category : #'Artefact-CodeSegment'
}

{ #category : #accessing }
PDFCodeSegment >> isDrawElement [
	^ isDrawElement
]

{ #category : #accessing }
PDFCodeSegment >> isDrawElement: anObject [
	isDrawElement := anObject
]

{ #category : #accessing }
PDFCodeSegment >> isSecure [
	^ true
]

{ #category : #accessing }
PDFCodeSegment >> printWith: aPDFWriter [ 
	^ self subclassResponsibility 
]

{ #category : #accessing }
PDFCodeSegment >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFCodeSegment >> styleSheet: anObject [
	styleSheet := anObject
]

{ #category : #accessing }
PDFCodeSegment >> wh [
	^ wh
]

{ #category : #accessing }
PDFCodeSegment >> wh: anObject [
	wh := anObject
]
