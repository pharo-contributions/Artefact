Class {
	#name : #PDFDotted,
	#superclass : #Object,
	#instVars : [
		'length',
		'space'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFDotted >> length [
	^ length ifNil: [ length := 1 ]
]

{ #category : #accessing }
PDFDotted >> length: anObject [
	length := anObject
]

{ #category : #private }
PDFDotted >> setDottedInto: aDocument [
	"Answer the dotted configuration"

	^(String streamContents: [ :s |
		s nextPutAll: '[';
		print: ((self length * aDocument scaleFactor) roundDownTo: 0.001);
		space;
		print: ((self space * aDocument scaleFactor) roundDownTo: 0.001);
		nextPutAll: '] 0';
		space;
		nextPutAll: PDFByteCode dotted
	]).
]

{ #category : #accessing }
PDFDotted >> space [
	^ space ifNil: [ space := 1 ]
]

{ #category : #accessing }
PDFDotted >> space: anObject [
	space := anObject
]
