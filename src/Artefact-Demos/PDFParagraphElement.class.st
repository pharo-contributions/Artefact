Class {
	#name : #PDFParagraphElement,
	#superclass : #PDFCompositeText,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #private }
PDFParagraphElement >> chomp: aString [
	"remove the last char of a string"
	
	^aString copyFrom: 1 to: (aString size - 1)
]

{ #category : #accessing }
PDFParagraphElement >> decalageOn: aPage. [
	^ (((self fontIfAbsent: aPage styleSheet) fontSize / aPage document scaleFactor) roundDownTo: 0.01).
]

{ #category : #accessing }
PDFParagraphElement >> getStyles [

	| lines decalage currentXY current |
	lines := self splitOn: (self page).
	decalage := self decalageOn: (self page).
	currentXY := self from.
	^ lines collect: [:aLine | current := PDFFormatedTextElement new styleSheet: (self styleSheet); alignment: self alignment; from: currentXY; wh: self wh; text: aLine.
			currentXY := currentXY + (0@decalage).
			current ].
]

{ #category : #action }
PDFParagraphElement >> splitOn: aPage [
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
PDFParagraphElement >> wordsList [
	"answer the list of words in the text"
	
	^(self text subStrings: ' ')
]
