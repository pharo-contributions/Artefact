Class {
	#name : #PDFPage,
	#superclass : #Object,
	#instVars : [
		'number',
		'page'
	],
	#category : #Artefact
}

{ #category : #action }
PDFPage >> add: aStyle [
	"add a style to a page"
	self page add: aStyle.
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
PDFPage >> page [
	^ page ifNil: [ page := OrderedCollection new ]
]

{ #category : #accessing }
PDFPage >> page: anObject [
	page := anObject
]
