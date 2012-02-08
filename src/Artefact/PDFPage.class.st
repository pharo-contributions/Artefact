Class {
	#name : #PDFPage,
	#superclass : #Object,
	#instVars : [
		'page'
	],
	#category : #Artefact
}

{ #category : #action }
PDFPage >> add: aStyle [
	"add a style to a page"
	self document add: aStyle.
]

{ #category : #'initialize-release' }
PDFPage >> initialize [
	super initialize
]

{ #category : #accessing }
PDFPage >> page [
	^ page ifNil: [ page := OrderedCollection new ]
]

{ #category : #accessing }
PDFPage >> page: anObject [
	page := anObject
]
