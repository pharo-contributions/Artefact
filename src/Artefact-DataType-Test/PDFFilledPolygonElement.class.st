Class {
	#name : #PDFFilledPolygonElement,
	#superclass : #PDFPolygonElement,
	#category : #'Artefact-Elements-Page-Basics'
}

{ #category : #render }
PDFFilledPolygonElement >> fillmode [
	^ PDFByteCode filling 
]
