Class {
	#name : #PDFImage,
	#superclass : #PDFStyle,
	#instVars : [
		'filename'
	],
	#category : #Artefact
}

{ #category : #configuration }
PDFImage >> initStyle: aDocument [

]

{ #category : #render }
PDFImage >> render: aDocument [
	self subclassResponsibility
]
