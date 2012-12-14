Class {
	#name : #PDFFilledRectElement,
	#superclass : #PDFRectElement,
	#category : #'Artefact-Elements-Page-Basics'
}

{ #category : #render }
PDFFilledRectElement >> fillmode [
	^PDFByteCode filling
]
