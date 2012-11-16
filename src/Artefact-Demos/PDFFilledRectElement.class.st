Class {
	#name : #PDFFilledRectElement,
	#superclass : #PDFRectElement,
	#category : #'Artefact-Elements'
}

{ #category : #render }
PDFFilledRectElement >> fillmode [
	^PDFByteCode filling
]
