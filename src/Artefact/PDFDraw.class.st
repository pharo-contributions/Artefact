Class {
	#name : #PDFDraw,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh',
		'destination',
		'width'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFDraw >> destination [
	^ destination
]

{ #category : #accessing }
PDFDraw >> destination: anObject [
	destination := anObject
]

{ #category : #accessing }
PDFDraw >> wh [
	^ wh
]

{ #category : #accessing }
PDFDraw >> wh: anObject [
	wh := anObject
]

{ #category : #accessing }
PDFDraw >> width [
	^width ifNil: [ width := 1]
]

{ #category : #accessing }
PDFDraw >> width: anObject [
	width := anObject
]

{ #category : #accessing }
PDFDraw >> xy [
	^ xy
]

{ #category : #accessing }
PDFDraw >> xy: anObject [
	xy := anObject
]
