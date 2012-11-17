Class {
	#name : #PDFCompositeDraw,
	#superclass : #PDFComposite,
	#instVars : [
		'to'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #accessing }
PDFCompositeDraw >> dotted: aPDFDottedObject [
	self styleSheet dotted: aPDFDottedObject
]

{ #category : #accessing }
PDFCompositeDraw >> dottedIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #dotted ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFCompositeDraw >> drawColor: aColor [
	self styleSheet drawColor: aColor
]

{ #category : #accessing }
PDFCompositeDraw >> drawColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #drawColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFCompositeDraw >> thickness: aThickness [
	self styleSheet thickness:  aThickness
]

{ #category : #accessing }
PDFCompositeDraw >> thicknessIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #thickness ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFCompositeDraw >> to [
	^to
]

{ #category : #accessing }
PDFCompositeDraw >> to: anObject [
	to := anObject
]
