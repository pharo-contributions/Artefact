Class {
	#name : #PDFText,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh',
		'text',
		'font'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFText >> font [
	^ font ifNil: [ font := PDFHelveticaFont new ]
]

{ #category : #accessing }
PDFText >> font: anObject [
	font := anObject
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
