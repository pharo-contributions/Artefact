Class {
	#name : #PDFVisibleItem,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh'
	],
	#category : #'Artefact-Styles'
}

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
