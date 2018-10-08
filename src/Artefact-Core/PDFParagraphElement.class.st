"
A PDFParagraphElement is a text with carriage return (automatically calculated from width dimension).

Styles hierarchy:
#paragraph
"
Class {
	#name : #PDFParagraphElement,
	#superclass : #PDFCompositeText,
	#instVars : [
		'spacing'
	],
	#category : #'Artefact-Core-Elements-Composites'
}

{ #category : #style }
PDFParagraphElement >> defaultStyle [
	^ #text
]

{ #category : #accessing }
PDFParagraphElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	| lines decalage currentXY current |
	lines := self splitOn: aPDFGenerator currentPage using: aStyleSheet font.
	decalage := aStyleSheet font fontSize.
	currentXY := self from.
	^ lines
		collect: [ :aLine | 
			current := PDFFormattedTextElement new
				from: currentXY;
				dimension: self dimension;
				text: aLine.
			currentXY := currentXY + (0 @ decalage) + (0 @ self spacing).
			current ]
]

{ #category : #'initialize-release' }
PDFParagraphElement >> initialize [
	super initialize.
	self spacing: 0 mm.
]

{ #category : #checking }
PDFParagraphElement >> requiredAttributes [
	^ #( from text dimension )
]

{ #category : #accessing }
PDFParagraphElement >> spacing [
	^spacing
]

{ #category : #accessing }
PDFParagraphElement >> spacing: aValue [ 	
	spacing := aValue
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
			widthOfLine + (widthOfWord := aFont getStringWidth: word) <= self dimension x
				ifTrue: [ 
					line nextPutAll: word.
					widthOfLine := widthOfLine + widthOfWord ]
				ifFalse: [ 
					widthOfWord > self dimension x
						ifTrue: [ 
							ArtefactOverSizedContent new
								content: aWord;
								signal ].
					lines add: (line contents asString allButLast).
					line
						resetContents;
						nextPutAll: word.
					widthOfLine := widthOfWord ] ].
	lines add: (line contents asString allButLast).	"close the stream"
	line close.
	^ lines
]

{ #category : #private }
PDFParagraphElement >> wordsList [
	"answer the list of words in the text"

	^ self text substrings: ' '
]
