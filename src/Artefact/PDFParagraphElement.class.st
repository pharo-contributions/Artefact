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
PDFParagraphElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [

	| lines decalage currentXY current |
	lines := self splitOn: (aPDFGenerator currentPage) using: aStyleSheet font.
	decalage := aStyleSheet font fontSize.
	currentXY := self from.
	^ lines collect: [:aLine | current := PDFFormattedTextElement new styleSheet: aStyleSheet; alignment: self alignment; from: currentXY; wh: self wh; text: aLine.
			currentXY := currentXY + (0@decalage).
			current ].
]

{ #category : #action }
PDFParagraphElement >> splitOn: aPage using: aFont [
	"answer the lines of the paragraph (in the context of the specified page)"

	| widthOfLine widthOfWord line lines |
	widthOfLine := 0 pt.
	line := WriteStream on: String new.
	lines := OrderedCollection new.
	self wordsList
		do: [ :aWord | 
			| word |
			word := aWord , ' '.
			widthOfLine + (widthOfWord := aFont getStringWidth: word) <= self wh x
				ifTrue: [ 
					line nextPutAll: word.
					widthOfLine := widthOfLine + widthOfWord ]
				ifFalse: [ 
					widthOfWord > self wh x
						ifTrue: [ 
							ArtefactOverSizedContent new
								content: aWord;
								signal ].
					lines add: (self chomp: line contents asString).
					line
						resetContents;
						nextPutAll: word.
					widthOfLine := widthOfWord ] ].
	lines add: (self chomp: line contents asString).	"close the stream"
	line close.
	^ lines
]

{ #category : #private }
PDFParagraphElement >> wordsList [
	"answer the list of words in the text"
	
	^(self text subStrings: ' ')
]
