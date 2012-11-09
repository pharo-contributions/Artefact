Class {
	#name : #PDFFilledPolygonStyle,
	#superclass : #PDFPolygonStyle,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFFilledPolygonStyle >> fillmode [
	^ PDFByteCode filling 
]
