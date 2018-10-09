"
A PDFDotted is a style of dotted line defined by the length of the segment and space between two of these.

Instance Variables
	length:		<Object>
	space:		<Object>

length
	- xxxxx

space
	- xxxxx

"
Class {
	#name : #PDFDotted,
	#superclass : #Object,
	#instVars : [
		'length',
		'space'
	],
	#category : #'Artefact-Core-Base'
}

{ #category : #private }
PDFDotted >> generateCodeWith: aPDFGenerator [
	"Answer the dotted configuration"

	^(String streamContents: [ :s |
		s nextPutAll: '[';
		print: (aPDFGenerator convertToPoints: self length);
		space;
		print: (aPDFGenerator convertToPoints: self space);
		nextPutAll: '] 0';
		space;
		nextPutAll: PDFByteCode dotted
	]).
]

{ #category : #accessing }
PDFDotted >> initialize [ 
	super initialize.
	self length: 1 pt.
	self space: 1 pt
]

{ #category : #accessing }
PDFDotted >> length [
	^ length
]

{ #category : #accessing }
PDFDotted >> length: anObject [
	length := anObject
]

{ #category : #accessing }
PDFDotted >> space [
	^ space
]

{ #category : #accessing }
PDFDotted >> space: anObject [
	space := anObject
]
