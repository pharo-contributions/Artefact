Class {
	#name : #PDFCompositeTextStyle,
	#superclass : #PDFCompositeStyle,
	#instVars : [
		'alignment'
	],
	#category : #'Artefact-Styles'
}

{ #category : #action }
PDFCompositeTextStyle >> alignCenter [
	self alignment: #CENTER
]

{ #category : #action }
PDFCompositeTextStyle >> alignLeft [
	self alignment: #LEFT
]

{ #category : #action }
PDFCompositeTextStyle >> alignRight [
	self alignment: #RIGHT
]

{ #category : #accessing }
PDFCompositeTextStyle >> alignment [
	^ alignment ifNil: [ alignment := #LEFT ]
]

{ #category : #accessing }
PDFCompositeTextStyle >> alignment: anObject [
	alignment := anObject
]

{ #category : #'as yet unclassified' }
PDFCompositeTextStyle >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #'as yet unclassified' }
PDFCompositeTextStyle >> fontIfAbsent: aStyleSheet. [
	^ (self styleSheet get: #font ifAbsentFrom: aStyleSheet)
]

{ #category : #'as yet unclassified' }
PDFCompositeTextStyle >> textColor: aColor [
	self styleSheet textColor: aColor
]

{ #category : #'as yet unclassified' }
PDFCompositeTextStyle >> textColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #textColor ifAbsentFrom: anAlternativeStyleSheet 
]
