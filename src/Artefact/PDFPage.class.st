Class {
	#name : #PDFPage,
	#superclass : #Object,
	#instVars : [
		'number',
		'styles'
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
