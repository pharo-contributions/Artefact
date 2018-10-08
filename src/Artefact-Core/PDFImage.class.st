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

{ #category : #'instance creation' }
PDFImage class >> from: aPosition dimension: aDimension fromStream: aStream [
	^ self new
		from: aPosition;
		dimension: aDimension;
		stream: aStream;
		yourself
]

{ #category : #'instance creation' }
PDFImage class >> fromMorph: aMorph [
	self subclassResponsibility 

]

{ #category : #'instance creation' }
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

{ #category : #render }
PDFImage >> producePageElementCodeWith: aPDFGenerator StyleSheet: anObject [
	| origin imageId |
	
	"Determine the vertical position of the image"
	 origin := aPDFGenerator determinePositionOnCurrentPage: (self from + (0 @ self dimension y) ).

	"Determine the id of the image"
	imageId:= aPDFGenerator getImageIdFor: self.
	 			
	^  (String streamContents: [ :s |
		s nextPutAll:  'q'; space;
		nextPutAll: (aPDFGenerator convertToPoints: self dimension x) asString; space;
		nextPutAll: '0 0'; space;
		nextPutAll: (aPDFGenerator convertToPoints: self dimension y) asString; space;
		nextPutAll: (origin x asString); space;
		nextPutAll: (origin y asString); space;
		nextPutAll: 'cm';space; 
		nextPut: $/; nextPutAll: imageId; space;
		nextPutAll: 'Do Q'
	 ]).
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
