"
A PDFDataString is the representation for a string in PDF.

Instance Variables
	text:		<Object>

text
	- xxxxx

"
Class {
	#name : #PDFDataString,
	#superclass : #PDFDataType,
	#instVars : [
		'text'
	],
	#category : #'Artefact-Core-DataTypes'
}

{ #category : #creation }
PDFDataString class >> text: aText [
	^ self new text: aText; yourself
]

{ #category : #visit }
PDFDataString >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataString: self
]

{ #category : #action }
PDFDataString >> escape: aString [
	"answer a clean string at PDF format"
	
	| str |
	str := aString copyWithRegex: '\\' matchesReplacedWith: '\\\'.	
	str := str copyWithRegex: '\(' matchesReplacedWith: '\('.
	str := str copyWithRegex: '\)' matchesReplacedWith: '\)'.

	^str
]

{ #category : #testing }
PDFDataString >> isPrintable [
	^ true
]

{ #category : #accessing }
PDFDataString >> printOn: aStream [
	aStream nextPut: $(; nextPutAll: (self escape: self text); nextPut: $)
]

{ #category : #accessing }
PDFDataString >> text [
	^ text asString
]

{ #category : #accessing }
PDFDataString >> text: anObject [
	text := anObject
]
