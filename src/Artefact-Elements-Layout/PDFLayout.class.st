Class {
	#name : #PDFLayout,
	#superclass : #PDFElement,
	#instVars : [
		'height'
	],
	#category : #'Artefact-Elements'
}

{ #category : #accessing }
PDFLayout >> height [
	^ height
]

{ #category : #accessing }
PDFLayout >> height: anObject [
	height := anObject
]

{ #category : #'as yet unclassified' }
PDFLayout >> initStyle: aDocument [
	"No default style here"
	^self
]
