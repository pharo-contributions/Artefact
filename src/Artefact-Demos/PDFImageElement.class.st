Class {
	#name : #PDFImageElement,
	#superclass : #PDFBasic,
	#category : #'Artefact-Elements'
}

{ #category : #configuration }
PDFImageElement >> initStyle: aDocument [
	^self

]

{ #category : #render }
PDFImageElement >> renderContentOn: aPage [
	self subclassResponsibility
]
