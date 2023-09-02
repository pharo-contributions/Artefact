"
Opacity control and Exclusion effect.
"
Class {
	#name : #PDFOpacityExclusion,
	#superclass : #PDFOpacity,
	#category : #'Artefact-Core-Opacity'
}

{ #category : #effect }
PDFOpacityExclusion >> blendMode [

	^ #Exclusion
]
