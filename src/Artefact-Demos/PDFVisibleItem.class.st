Class {
	#name : #PDFVisibleItem,
	#superclass : #PDFElement,
	#instVars : [
		'xy',
		'wh'
	],
	#category : #'Artefact-Elements'
}

{ #category : #'as yet unclassified' }
PDFVisibleItem >> userUnitToPoints: aValue into: aDocument [
	"answer the value in points"
	^ aValue * (aDocument scaleFactor) 
]

{ #category : #accessing }
PDFVisibleItem >> wh [
	^ wh
]

{ #category : #accessing }
PDFVisibleItem >> wh: anObject [
	wh := anObject
]

{ #category : #accessing }
PDFVisibleItem >> xy [
	^ xy
]

{ #category : #accessing }
PDFVisibleItem >> xy: anObject [
	xy := anObject
]
