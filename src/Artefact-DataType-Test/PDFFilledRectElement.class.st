Class {
	#name : #PDFFilledRectElement,
	#superclass : #PDFRectElement,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFFilledRectElement >> fillmode [
	^PDFByteCode filling
]
