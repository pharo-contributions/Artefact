"
A PDFText is the superclass for all basics text elements.

Instance Variables
	text:		<Object>

text
	- xxxxx

"
Class {
	#name : #PDFText,
	#superclass : #PDFBasic,
	#instVars : [
		'text'
	],
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #'instance creation' }
PDFText class >> from: aPosition text: aText [
	^ self new
		from: aPosition;
		text: aText;
		yourself
]

{ #category : #'instance creation' }
PDFText class >> from: aPosition text: aText font: aFont [
	^ self new
		from: aPosition;
		text: aText;
		font: aFont;
		yourself
]

{ #category : #defaults }
PDFText >> defaultStyle [
	^ #text
]

{ #category : #accessing }
PDFText >> escape: aString [
	"answer a clean string at PDF format"
	
	| str |
	str := aString copyWithRegex: '\\' matchesReplacedWith: '\\\'.	
	str := str copyWithRegex: '\(' matchesReplacedWith: '\('.
	str := str copyWithRegex: '\)' matchesReplacedWith: '\)'.

	^str
]

{ #category : #accessing }
PDFText >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #accessing }
PDFText >> isDrawElement [
	^ false
]

{ #category : #accessing }
PDFText >> text [
	(text isNil) ifTrue: [ text := '' ].
	^text
]

{ #category : #accessing }
PDFText >> text: anObject [
	text := anObject
]

{ #category : #accessing }
PDFText >> textColor: aColor [
	self styleSheet textColor: aColor
]

{ #category : #accessing }
PDFText >> textString: aString [
	"Answer a formated text string"
	
	^('(' , (self escape: (aString asString)) , ')')
]
