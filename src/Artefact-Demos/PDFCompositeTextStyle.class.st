Class {
	#name : #PDFCompositeTextStyle,
	#superclass : #PDFCompositeStyle,
	#instVars : [
		'alignment',
		'verticalAlignment'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFCompositeTextStyle >> alignment [
	^ alignment ifNil: [ alignment := #LEFT ]
]

{ #category : #accessing }
PDFCompositeTextStyle >> alignment: anObject [
	alignment := anObject
]

{ #category : #action }
PDFCompositeTextStyle >> bottom [
	self verticalAlignment: #BOTTOM
]

{ #category : #action }
PDFCompositeTextStyle >> center [
	self alignment: #CENTER
]

{ #category : #accessing }
PDFCompositeTextStyle >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #accessing }
PDFCompositeTextStyle >> fontIfAbsent: aStyleSheet. [
	^ (self styleSheet get: #font ifAbsentFrom: aStyleSheet)
]

{ #category : #action }
PDFCompositeTextStyle >> left [
	self alignment: #LEFT
]

{ #category : #action }
PDFCompositeTextStyle >> middle [
	self verticalAlignment: #MIDDLE
]

{ #category : #action }
PDFCompositeTextStyle >> right [
	self alignment: #RIGHT
]

{ #category : #accessing }
PDFCompositeTextStyle >> textColor: aColor [
	self styleSheet textColor: aColor
]

{ #category : #accessing }
PDFCompositeTextStyle >> textColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #textColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #action }
PDFCompositeTextStyle >> top [
	self verticalAlignment: #TOP
]

{ #category : #accessing }
PDFCompositeTextStyle >> verticalAlignment [
	^ verticalAlignment ifNil: [ verticalAlignment := #TOP ]
]

{ #category : #accessing }
PDFCompositeTextStyle >> verticalAlignment: anObject [
	verticalAlignment := anObject
]
