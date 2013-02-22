Class {
	#name : #PDFFilledPolygonElement,
	#superclass : #PDFPolygonElement,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFFilledPolygonElement >> fillmode [
	^ PDFByteCode filling 
]
