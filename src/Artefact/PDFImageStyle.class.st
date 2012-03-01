Class {
	#name : #PDFImageStyle,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh'
	],
	#category : #Artefact
}

{ #category : #configuration }
PDFImageStyle >> initStyle: aDocument [

]

{ #category : #render }
PDFImageStyle >> render: aDocument [
	self subclassResponsibility
]
