Class {
	#name : #PDFLayout,
	#superclass : #PDFPageElement,
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
