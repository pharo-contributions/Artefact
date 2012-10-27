Class {
	#name : #PDFCompositeTextStyles,
	#superclass : #PDFComposite,
	#instVars : [
		'alignment',
		'verticalAlignment'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFCompositeTextStyles >> alignment [
	^ alignment ifNil: [ alignment := #LEFT ]
]

{ #category : #accessing }
PDFCompositeTextStyles >> alignment: anObject [
	alignment := anObject
]

{ #category : #action }
PDFCompositeTextStyles >> bottom [
	self verticalAlignment: #BOTTOM
]

{ #category : #action }
PDFCompositeTextStyles >> center [
	self alignment: #CENTER
]

{ #category : #accessing }
PDFCompositeTextStyles >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #accessing }
PDFCompositeTextStyles >> fontIfAbsent: aStyleSheet. [
	^ (self styleSheet get: #font ifAbsentFrom: aStyleSheet)
]

{ #category : #action }
PDFCompositeTextStyles >> left [
	self alignment: #LEFT
]

{ #category : #action }
PDFCompositeTextStyles >> middle [
	self verticalAlignment: #MIDDLE
]

{ #category : #action }
PDFCompositeTextStyles >> right [
	self alignment: #RIGHT
]

{ #category : #accessing }
PDFCompositeTextStyles >> textColor: aColor [
	self styleSheet textColor: aColor
]

{ #category : #accessing }
PDFCompositeTextStyles >> textColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #textColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #action }
PDFCompositeTextStyles >> top [
	self verticalAlignment: #TOP
]

{ #category : #accessing }
PDFCompositeTextStyles >> verticalAlignment [
	^ verticalAlignment ifNil: [ verticalAlignment := #TOP ]
]

{ #category : #accessing }
PDFCompositeTextStyles >> verticalAlignment: anObject [
	verticalAlignment := anObject
]
