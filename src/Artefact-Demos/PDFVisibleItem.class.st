Class {
	#name : #PDFVisibleItem,
	#superclass : #PDFElement,
	#instVars : [
		'wh',
		'from'
	],
	#category : #'Artefact-Elements'
}

{ #category : #accessing }
PDFVisibleItem >> from [
	^ from
]

{ #category : #accessing }
PDFVisibleItem >> from: anObject [
	from := anObject
]

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
