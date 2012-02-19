Class {
	#name : #PDFText,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh',
		'text'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFText >> text [
	(text isNil) ifTrue: [ text := '' ].
	^text
]

{ #category : #accessing }
PDFText >> text: anObject [
	text := anObject
]

{ #category : #accessing }
PDFText >> wh [
	^ wh
]

{ #category : #accessing }
PDFText >> wh: anObject [
	wh := anObject
]

{ #category : #accessing }
PDFText >> xy [
	^ xy
]

{ #category : #accessing }
PDFText >> xy: anObject [
	xy := anObject
]
