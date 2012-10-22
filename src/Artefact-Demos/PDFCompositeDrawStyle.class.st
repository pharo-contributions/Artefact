Class {
	#name : #PDFCompositeDrawStyle,
	#superclass : #PDFCompositeStyle,
	#instVars : [
		'destination'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFCompositeDrawStyle >> destination [
	^destination
]

{ #category : #accessing }
PDFCompositeDrawStyle >> destination: anObject [
	destination := anObject
]

{ #category : #accessing }
PDFCompositeDrawStyle >> drawColor: aColor [
	self styleSheet drawColor: aColor
]

{ #category : #accessing }
PDFCompositeDrawStyle >> drawColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #drawColor ifAbsentFrom: anAlternativeStyleSheet 
]
