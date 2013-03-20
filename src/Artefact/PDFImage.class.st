"
A PDFImage is the superclass for all basics image elements.

Instance Variables
	data:		<Object>
	reader:		<Object>
	to:		<Object>

data
	- xxxxx

reader
	- xxxxx

to
	- xxxxx

"
Class {
	#name : #PDFImage,
	#superclass : #PDFBasic,
	#instVars : [
		'filename',
		'data',
		'reader'
	],
	#category : #'Artefact-Elements-Basic'
}

{ #category : #accessing }
PDFImage >> data [
	^data
]

{ #category : #accessing }
PDFImage >> data: anObject [
	data := anObject
]

{ #category : #accessing }
PDFImage >> filename [
	^filename
]

{ #category : #accessing }
PDFImage >> filename: aFilename [ 	
	filename := aFilename.
	self readImage: filename
]

{ #category : #'initialize-release' }
PDFImage >> initialize [
	super initialize. 
	self styleSheet: PDFStyleSheet new
]

{ #category : #accessing }
PDFImage >> isDrawElement [
	^ false
]

{ #category : #action }
PDFImage >> readImage: aFilename [ 
	self subclassResponsibility
]

{ #category : #accessing }
PDFImage >> reader [
	^reader
]

{ #category : #accessing }
PDFImage >> reader: anObject [ 	
	reader := anObject
]
