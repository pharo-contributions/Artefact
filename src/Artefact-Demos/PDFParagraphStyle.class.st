Class {
	#name : #PDFParagraphStyle,
	#superclass : #PDFFormatedText,
	#instVars : [
		'lines',
		'numberOfLines',
		'listOfLines'
	],
	#category : #'Artefact-Styles'
}

{ #category : #private }
PDFParagraphStyle >> chomp: aString [
	"remove the last char of a string"
	
	^aString copyFrom: 1 to: (aString size - 1)
]

{ #category : #action }
PDFParagraphStyle >> getLines [
	"answer the content of each lines in the paragraph"
	
	^self listOfLines
]

{ #category : #action }
PDFParagraphStyle >> getNumberOfLines [
	"answer the number of lines in the paragraph"
	
	^self numberOfLines
]

{ #category : #accessing }
PDFParagraphStyle >> lines [
	^lines ifNil: [ lines := OrderedCollection new ]
]

{ #category : #accessing }
PDFParagraphStyle >> lines: anObject [
	lines := anObject
]

{ #category : #accessing }
PDFParagraphStyle >> listOfLines [
	^listOfLines
]

{ #category : #accessing }
PDFParagraphStyle >> listOfLines: aObject [
	listOfLines := aObject
]

{ #category : #accessing }
PDFParagraphStyle >> numberOfLines [
	^numberOfLines
]

{ #category : #accessing }
PDFParagraphStyle >> numberOfLines: aObject [
	numberOfLines := aObject
]

{ #category : #render }
PDFParagraphStyle >> renderContentOn: aPage [
	"answer the definition of a paragraph of text"

	| container font scaledFontSize |
	
	(self xy isNil) ifTrue: [ self xy: aPage xy ] ifFalse: [ aPage xy: self xy ].
	self drawBox.

	font := (self styleSheet get: #font ifAbsentFrom: aPage document styleSheet) .
	scaledFontSize := (font scaledFontSize: aPage document scaleFactor).

	(self splitOn: aPage) do: [ :aLine |
		self out: (PDFCellStyle new
			xy: self xy;
			wh: (self wh x @ scaledFontSize); 
			ink: self ink;
			fillColor: self fillColor;
			font: (self font); 
			text: aLine;
			border: false;
			linefeed: false;
			alignment: self alignment). 
			self xy: self xy x @ (self xy y + scaledFontSize).	
	].

	"set the new current position and linefeed ?"
	aPage lasth: self wh y.
	aPage xy: (aPage margins x) @ (aPage xy y + self wh y).
	
	 ^self buffer
	
]

{ #category : #action }
PDFParagraphStyle >> splitOn: aPage [
	"answer the lines of the paragraph (in the context of the specified page)"
	
	| widthOfLine widthOfWord line |
		
	widthOfLine := 0.
	
	line := WriteStream on: String new.
	
	self wordsList do: [ :aWord |
		| word |
		 word := aWord , ' '.
		(widthOfLine + (widthOfWord := self font getStringWidth: word into: (aPage document))) <= (self wh x)
			ifTrue: [ 
				line nextPutAll: word.
				widthOfLine := widthOfLine + widthOfWord.
				]
			ifFalse: [
				self lines add: (self chomp: (line contents asString)).
				line resetContents; nextPutAll: word.
				widthOfLine := widthOfWord.
				]	
	].
	self lines add: (self chomp: (line contents asString)).

	self listOfLines: self lines contents.
	self numberOfLines: self lines size.
	
	"close the stream"
	line close.
	
	^self listOfLines
]

{ #category : #private }
PDFParagraphStyle >> wordsList [
	"answer the list of words in the text"
	
	^(self text subStrings: ' ')
]
