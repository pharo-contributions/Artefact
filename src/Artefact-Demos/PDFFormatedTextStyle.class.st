Class {
	#name : #PDFFormatedTextStyle,
	#superclass : #PDFCompositeTextStyle,
	#instVars : [
		'textElement'
	],
	#category : #'Artefact-Styles'
}

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> defineXYforTextStyle:  aTextElement On: aPage [

	"Set right x values for text"
	| font width decx height |
	
	font := aTextElement fontIfAbsent: aPage styleSheet.
	
	width := font getStringWidth: aTextElement text into: (aPage document).
	height := (font scaledFontSize: aPage document scaleFactor) roundDownTo: 0.001.
		
	"determining the horizontal offset"
	(self alignment = #RIGHT) 
			ifTrue: [ decx := self wh x - width ] 
			ifFalse: [ 
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := 0 ] 
			].
		
	aTextElement xy: (decx + self xy x)@(self xy y + height) 
]

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> font: aFont [
	textElement font: aFont
]

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> getStyles [

	self defineXYforTextStyle: textElement On: (self page).

	^ {textElement}
]

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> initialize [
	super initialize.
	textElement := PDFTextStyle new.
]

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> text [
	^ textElement text
]

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> text: aString [
	textElement text: aString
]

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> textColor: aColor [
	textElement textColor: aColor
]
