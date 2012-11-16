Class {
	#name : #PDFFilledPolygonElement,
	#superclass : #PDFPolygonElement,
	#category : #'Artefact-Elements'
}

{ #category : #render }
PDFFilledPolygonElement >> fillmode [
	^ PDFByteCode filling 
]
