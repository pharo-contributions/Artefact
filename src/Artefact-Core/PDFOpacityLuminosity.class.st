"
Opacity control and Luminosity effect.
"
Class {
	#name : #PDFOpacityLuminosity,
	#superclass : #PDFOpacity,
	#category : #'Artefact-Core-Opacity'
}

{ #category : #effect }
PDFOpacityLuminosity >> blendMode [

	^ #Luminosity
]
