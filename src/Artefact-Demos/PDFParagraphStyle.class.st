Class {
	#name : #PDFParagraphStyle,
	#superclass : #PDFCompositeText,
	#instVars : [
		'text'
	],
	#category : #'Artefact-Styles'
}

{ #category : #private }
PDFParagraphStyle >> chomp: aString [
	"remove the last char of a string"
	
	^aString copyFrom: 1 to: (aString size - 1)
]

{ #category : #accessing }
PDFParagraphStyle >> decalageOn: aPage. [
	^ (((self fontIfAbsent: aPage styleSheet) fontSize / aPage document scaleFactor) roundDownTo: 0.01).
]

{ #category : #accessing }
PDFParagraphStyle >> getStyles [

	| lines decalage currentXY current |
	lines := self splitOn: (self page).
	decalage := self decalageOn: (self page).
	currentXY := self xy.
	^ lines collect: [:aLine | current := PDFFormatedTextStyle new styleSheet: (self styleSheet); alignment: self alignment; xy: currentXY; wh: self wh; text: aLine.
			currentXY := currentXY + (0@decalage).
			current ].
]

{ #category : #action }
PDFParagraphStyle >> splitOn: aPage [
	"answer the lines of the paragraph (in the context of the specified page)"
	
	| widthOfLine widthOfWord line lines  |
		
	widthOfLine := 0.
	
	line := WriteStream on: String new.
	lines := OrderedCollection new.
	
	self wordsList do: [ :aWord |
		| word |
		 word := aWord , ' '.
		(widthOfLine + (widthOfWord := (self fontIfAbsent: aPage styleSheet) getStringWidth: word into: (aPage document))) <= (self wh x)
			ifTrue: [ 
				line nextPutAll: word.
				widthOfLine := widthOfLine + widthOfWord.
				]
			ifFalse: [
				lines add: (self chomp: (line contents asString)).
				line resetContents; nextPutAll: word.
				widthOfLine := widthOfWord.
				]	
	].
	
	lines add: (self chomp: (line contents asString)).
	
	"close the stream"
	line close.
	
	^ lines
]

{ #category : #private }
PDFParagraphStyle >> text [
	^ text 
]

{ #category : #private }
PDFParagraphStyle >> text: aText [
	text := aText.
]

{ #category : #private }
PDFParagraphStyle >> wordsList [
	"answer the list of words in the text"
	
	^(self text subStrings: ' ')
]
