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
	
	^ '[' , (((self length * aDocument scaleFactor) roundDownTo: 0.001) asString), ' ' , (((self space * aDocument scaleFactor) roundDownTo: 0.001) asString) , '] 0 d'.

]

{ #category : #accessing }
PDFDotted >> space [
	^ space ifNil: [ space := 1 ]
]

{ #category : #accessing }
PDFDotted >> space: anObject [
	space := anObject
]
