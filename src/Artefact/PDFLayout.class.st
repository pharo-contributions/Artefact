Class {
	#name : #PDFLayout,
	#superclass : #PDFStyle,
	#instVars : [
		'height'
	],
	#category : #Artefact
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
