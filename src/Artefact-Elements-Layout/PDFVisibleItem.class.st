Class {
	#name : #PDFVisibleItem,
	#superclass : #PDFElement,
	#instVars : [
		'wh',
		'from'
	],
	#category : #'Artefact-Elements'
}

{ #category : #accessing }
PDFVisibleItem >> from [
	^ from
]

{ #category : #accessing }
PDFVisibleItem >> from: anObject [
	from := anObject
]

{ #category : #accessing }
PDFVisibleItem >> wh [
	^ wh
]

{ #category : #accessing }
PDFVisibleItem >> wh: anObject [
	wh := anObject
]
