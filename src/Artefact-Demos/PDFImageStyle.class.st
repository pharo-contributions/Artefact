Class {
	#name : #PDFImageStyle,
	#superclass : #PDFBasic,
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
