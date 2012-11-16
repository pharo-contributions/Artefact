Class {
	#name : #PDFFilledCircleElement,
	#superclass : #PDFCircleElement,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFFilledCircleElement >> fillmode [
	^ PDFByteCode filling
]
