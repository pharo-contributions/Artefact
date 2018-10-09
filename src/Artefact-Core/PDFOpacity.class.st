"
A PDFOpacity is thethe abstract class that inherits all usable opacity effects. 

"
Class {
	#name : #PDFOpacity,
	#superclass : #Object,
	#instVars : [
		'alpha'
	],
	#category : #'Artefact-Core-Opacity'
}

{ #category : #'as yet unclassified' }
PDFOpacity class >> alpha: aAlphaValue [ 
	"set the alpha value for opacity (between 0 and 1)"
	
	^self new alpha: aAlphaValue
]

{ #category : #accessing }
PDFOpacity >> alpha [
	^ alpha
]

{ #category : #accessing }
PDFOpacity >> alpha: anObject [
	alpha := anObject
]

{ #category : #effect }
PDFOpacity >> blendMode [
	"must answer the blendMode"
	self subclassResponsibility 
]
