Class {
	#name : #PDFDraw,
	#superclass : #PDFStyle,
	#instVars : [
		'xy',
		'wh',
		'destination',
		'thickness',
		'dotted'
	],
	#category : #'Artefact-Styles'
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
PDFDraw >> dotted [
	^dotted
]

{ #category : #accessing }
PDFDraw >> dotted: anObject [
	dotted := anObject
]

{ #category : #configuration }
PDFDraw >> initStyle: aDocument [
	"Set line thickness to n point"
	self out: ((self thickness / aDocument scaleFactor) roundDownTo: 0.001) asString , ' w'.
	
	"Set line cap style to square"
	self out: '2 J'.
	
	"Set the colors or grey levels"
	self out: (self setColorForInk: (self ink) fillWith: (self fillColor)).

	"Set the dotted if defined"
	(self dotted isNil) 
		ifTrue: [ self out: '[] 0 d' ]
		ifFalse: [ self out: (self dotted getConfigurationInto: aDocument) ]

	
]

{ #category : #accessing }
PDFDraw >> thickness [
	^thickness ifNil: [ thickness := 1]
]

{ #category : #accessing }
PDFDraw >> thickness: anObject [
	thickness := anObject
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
PDFDraw >> xy [
	^ xy
]

{ #category : #accessing }
PDFDraw >> xy: anObject [
	xy := anObject
]
