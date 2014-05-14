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
		'stream',
		'originalImageDimensions'
	],
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #'as yet unclassified' }
PDFImage class >> from: aPosition wh: aDimension fromStream: aStream [
	^ self new
		from: aPosition;
		dimension: aDimension;
		stream: aStream;
		yourself
]

{ #category : #'as yet unclassified' }
PDFImage class >> fromStream: aStream [
	^ self new
		stream: aStream;
		yourself
]

{ #category : #defaults }
PDFImage >> defaultStyle [ 
	^ #image
]

{ #category : #'as yet unclassified' }
PDFImage >> height: aHeight [
	self dimension: (aHeight / self originalImageDimensions y * self originalImageDimensions x) @ aHeight
]

{ #category : #accessing }
PDFImage >> isDrawElement [ 
	^ false
]

{ #category : #accessing }
PDFImage >> originalImageDimensions [
	^ originalImageDimensions
]

{ #category : #accessing }
PDFImage >> stream [
	^ stream
]

{ #category : #accessing }
PDFImage >> stream: anImageStream [
	stream := anImageStream.
	
]

{ #category : #'as yet unclassified' }
PDFImage >> width: aWidth [
	self dimension: aWidth @ (aWidth / self originalImageDimensions x * self originalImageDimensions y) 
]
