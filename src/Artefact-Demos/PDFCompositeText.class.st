Class {
	#name : #PDFCompositeText,
	#superclass : #PDFComposite,
	#instVars : [
		'text',
		'alignment',
		'verticalAlignment',
		'margin'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFCompositeText >> alignment [
	^ alignment ifNil: [ alignment := #LEFT ]
]

{ #category : #accessing }
PDFCompositeText >> alignment: anObject [
	alignment := anObject
]

{ #category : #action }
PDFCompositeText >> bottom [
	self verticalAlignment: #BOTTOM
]

{ #category : #action }
PDFCompositeText >> center [
	self alignment: #CENTER
]

{ #category : #style }
PDFCompositeText >> defaultMargin [
	^0
]

{ #category : #accessing }
PDFCompositeText >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #accessing }
PDFCompositeText >> fontIfAbsent: aStyleSheet. [
	^ (self styleSheet get: #font ifAbsentFrom: aStyleSheet)
]

{ #category : #action }
PDFCompositeText >> left [
	self alignment: #LEFT
]

{ #category : #accessing }
PDFCompositeText >> margin [
	^margin ifNil: [ margin := self defaultMargin ]
]

{ #category : #accessing }
PDFCompositeText >> margin: aMargin [
	margin := aMargin
]

{ #category : #action }
PDFCompositeText >> middle [
	self verticalAlignment: #MIDDLE
]

{ #category : #action }
PDFCompositeText >> right [
	self alignment: #RIGHT
]

{ #category : #accessing }
PDFCompositeText >> text [
	^text
]

{ #category : #accessing }
PDFCompositeText >> text: aString [
	text := aString
]

{ #category : #accessing }
PDFCompositeText >> textColor: aColor [
	self styleSheet textColor: aColor
]

{ #category : #accessing }
PDFCompositeText >> textColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #textColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #action }
PDFCompositeText >> top [
	self verticalAlignment: #TOP
]

{ #category : #accessing }
PDFCompositeText >> verticalAlignment [
	^ verticalAlignment ifNil: [ verticalAlignment := #TOP ]
]

{ #category : #accessing }
PDFCompositeText >> verticalAlignment: anObject [
	verticalAlignment := anObject
]
