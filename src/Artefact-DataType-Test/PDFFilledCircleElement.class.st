Class {
	#name : #PDFFilledCircleElement,
	#superclass : #PDFCircleElement,
	#category : #'Artefact-Elements-Page-Basics'
}

{ #category : #render }
PDFFilledCircleElement >> fillmode [
	^ PDFByteCode filling
]
