"
A PDFArrow is the superclass for every drawable element (not directly usable).

"
Class {
	#name : #PDFCompositeDraw,
	#superclass : #PDFComposite,
	#instVars : [
		'to'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #style }
PDFCompositeDraw >> roundCap: aBoolean [
	self styleSheet roundCap: aBoolean
]

{ #category : #accessing }
PDFCompositeDraw >> to [
	^to
]

{ #category : #accessing }
PDFCompositeDraw >> to: anObject [
	to := anObject
]
