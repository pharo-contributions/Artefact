Class {
	#name : #PDFFilledCircleElement,
	#superclass : #PDFCircleElement,
	#category : #'Artefact-Elements'
}

{ #category : #render }
PDFFilledCircleElement >> fillmode [
	^ PDFByteCode filling
]
