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

{ #category : #configuration }
PDFDraw >> initStyle: aDocument [
	"Set line width to n point"
	self out: ((self width / aDocument scaleFactor) roundDownTo: 0.001) asString , ' w'.
	
	"Set line cap style to square"
	self out: '2 J'.
	
	"Set the colors or grey levels"
	self out: (self setColorForInk: (self ink) fillWith: (self fillColor))
	
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
