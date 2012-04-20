Class {
	#name : #PDFImageStyle,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh'
	],
	#category : #'Artefact-Styles'
}

{ #category : #configuration }
PDFImageStyle >> initStyle: aDocument [
	^self

]

{ #category : #render }
PDFImageStyle >> renderContentOn: aPage [
	self subclassResponsibility
]
