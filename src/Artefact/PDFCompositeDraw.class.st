"
A PDFArrow is the superclass for every drawable element (not directly usable).

"
Class {
	#name : #PDFCompositeDraw,
	#superclass : #PDFComposite,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #style }
PDFCompositeDraw >> roundCap: aBoolean [
	self styleSheet roundCap: aBoolean
]
