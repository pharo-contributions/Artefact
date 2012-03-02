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
	^self

]

{ #category : #render }
PDFImageStyle >> renderContentOn: aDocument [
	self subclassResponsibility
]
