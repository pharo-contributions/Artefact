Class {
	#name : #PDFVisibleItem,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh'
	],
	#category : #'Artefact-Styles'
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
