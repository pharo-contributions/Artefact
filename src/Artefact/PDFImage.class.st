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
		'stream'
	],
	#category : #'Artefact-Elements-Basic'
}

{ #category : #'as yet unclassified' }
PDFImage class >> fromStream: aStream [
	^ self new
		stream: aStream;
		yourself
]

{ #category : #'as yet unclassified' }
PDFImage >> defaultStyle [ 
	^ #image
]

{ #category : #accessing }
PDFImage >> isDrawElement [ 
	^ false
]

{ #category : #accessing }
PDFImage >> stream [
	^ stream
]

{ #category : #accessing }
PDFImage >> stream: anObject [
	stream := anObject
]
