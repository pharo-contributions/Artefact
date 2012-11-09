Class {
	#name : #PDFFilledCircleStyle,
	#superclass : #PDFCircleStyle,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFFilledCircleStyle >> fillmode [
	^ PDFByteCode filling
]
