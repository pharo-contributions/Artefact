Class {
	#name : #PDFParagraphStyle,
	#superclass : #PDFFormatedText,
	#instVars : [
		'lines',
		'numberOfLines',
		'listOfLines'
	],
	#category : #Artefact
}

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

	| container |
	
	(self xy isNil) ifTrue: [ self xy: aPage xy ] ifFalse: [ aPage xy: self xy ].
	self drawBox.

	(self splitOn: aPage) do: [ :aLine |
		self out: (PDFCellStyle new 
				wh: (self wh x @ self pdfFontSize); 
				ink: self ink;
				fillColor: self fillColor;
				font: (self font); 
				text: aLine;
				border: false;
				linefeed: true;
				alignment: self alignment). 
	].

	(self linefeed) ifTrue: [ self out: (PDFLineFeed new) ].


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
				self lines add: line contents asString.
				line resetContents; nextPutAll: word.
				widthOfLine := widthOfWord.
				]	
	].

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
