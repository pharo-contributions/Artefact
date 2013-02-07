Class {
	#name : #PDFDataString,
	#superclass : #PDFDataType,
	#instVars : [
		'text'
	],
	#category : #'Artefact-DataType'
}

{ #category : #action }
PDFDataString >> escape: aString [
	"answer a clean string at PDF format"
	
	| str |
	str := aString copyWithRegex: '\\' matchesReplacedWith: '\\\'.	
	str := str copyWithRegex: '\(' matchesReplacedWith: '\('.
	str := str copyWithRegex: '\)' matchesReplacedWith: '\)'.

	^str
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
