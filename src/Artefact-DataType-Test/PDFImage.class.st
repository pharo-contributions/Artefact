Class {
	#name : #PDFImage,
	#superclass : #Object,
	#instVars : [
		'picture',
		'data'
	],
	#category : #Artefact
}

{ #category : #action }
PDFImage >> fileName: aFileName [
	"Load a picture and answer an object that describe the picture"
	
	self subclassResponsibility
	
]
