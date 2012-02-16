Class {
	#name : #PDFPage,
	#superclass : #Object,
	#instVars : [
		'number',
		'styles',
		'xy',
		'lasth'
	],
	#category : #Artefact
}

{ #category : #action }
PDFPage >> add: aStyle [
	"add a style to a page"
	self styles add: aStyle.
]

{ #category : #'initialize-release' }
PDFPage >> initialize [
	super initialize
]

{ #category : #accessing }
PDFPage >> lasth [
	"height of last cell printed"
	^ lasth
]

{ #category : #accessing }
PDFPage >> lasth: lastCellHeight [
	lasth :=  lastCellHeight
]

{ #category : #accessing }
PDFPage >> number [
	^ number ifNil: [ number := 0 ]
]

{ #category : #accessing }
PDFPage >> number: aObject [
	number := aObject
]

{ #category : #accessing }
PDFPage >> styles [
	^ styles ifNil: [ styles := OrderedCollection new ]
]

{ #category : #accessing }
PDFPage >> styles: aCollectionOfStyle [
	styles := aCollectionOfStyle
]

{ #category : #accessing }
PDFPage >> xy [
	^ xy
]

{ #category : #accessing }
PDFPage >> xy: aCurrentPosition [
	xy := aCurrentPosition
]
