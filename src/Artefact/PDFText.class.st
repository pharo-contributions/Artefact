Class {
	#name : #PDFText,
	#superclass : #PDFBasic,
	#instVars : [
		'text'
	],
	#category : #'Artefact-Elements-Basic'
}

{ #category : #accessing }
PDFText >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #'as yet unclassified' }
PDFText >> isDrawElement [
	^ false
]

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
PDFText >> textColor: aColor [
	self styleSheet textColor: aColor
]
