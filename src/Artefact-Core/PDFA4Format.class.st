"
The A4 paper format
"
Class {
	#name : #PDFA4Format,
	#superclass : #PDFFormat,
	#category : #'Artefact-Core-Formats'
}

{ #category : #'accessing - defaults' }
PDFA4Format >> defaultSize [
	^ 595.3 point @ 841.9 point
]
