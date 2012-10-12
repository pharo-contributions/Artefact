Class {
	#name : #PDFFormatedText,
	#superclass : #PDFCompositeTextStyle,
	#instVars : [
		'textElement'
	],
	#category : #'Artefact-Styles'
}

{ #category : #'as yet unclassified' }
PDFFormatedText >> defineXYforTextStyle:  aTextElement On: aPage [

	"Set right xy values for text"
	| font width decx |
	font := aTextElement fontIfAbsent: aPage styleSheet.
	width := font getStringWidth: aTextElement text into: (aPage document).
	
	(self alignment = #RIGHT) 
			ifTrue: [ decx := self wh x - width ] 
			ifFalse: [ 
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := 0 ] 
			].
	
	(aTextElement xy: ( decx + self xy x)@((self xy y + (self wh y) + (font scaledFontSize: aPage document scaleFactor)) roundDownTo: 0.001)). 
]

{ #category : #'as yet unclassified' }
PDFFormatedText >> font: aFont [
	textElement font: aFont
]

{ #category : #'as yet unclassified' }
PDFFormatedText >> getStyles: aPage [

	self defineXYforTextStyle: textElement On: aPage.

	^ {textElement}
]

{ #category : #'as yet unclassified' }
PDFFormatedText >> initialize [
	super initialize.
	textElement := PDFTextStyle new.
]

{ #category : #'as yet unclassified' }
PDFFormatedText >> text [
	^ textElement text
]

{ #category : #'as yet unclassified' }
PDFFormatedText >> text: aString [
	textElement text: aString
]

{ #category : #'as yet unclassified' }
PDFFormatedText >> textColor: aColor [
	textElement textColor: aColor
]
