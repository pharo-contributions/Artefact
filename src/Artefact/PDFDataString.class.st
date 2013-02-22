Class {
	#name : #PDFDataString,
	#superclass : #PDFDataType,
	#instVars : [
		'text'
	],
	#category : #'Artefact-DataType'
}

{ #category : #creation }
PDFDataString class >> text: aText [
	^ self new text: aText; yourself
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
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
