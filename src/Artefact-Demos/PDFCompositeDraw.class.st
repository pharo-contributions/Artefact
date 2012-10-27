Class {
	#name : #PDFCompositeDraw,
	#superclass : #PDFComposite,
	#instVars : [
		'destination'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFCompositeDraw >> destination [
	^destination
]

{ #category : #accessing }
PDFCompositeDraw >> destination: anObject [
	destination := anObject
]

{ #category : #accessing }
PDFCompositeDraw >> drawColor: aColor [
	self styleSheet drawColor: aColor
]

{ #category : #accessing }
PDFCompositeDraw >> drawColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #drawColor ifAbsentFrom: anAlternativeStyleSheet 
]
