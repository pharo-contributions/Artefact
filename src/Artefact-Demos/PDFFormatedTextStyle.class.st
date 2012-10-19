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

	"Set right xy values for text"
	| font width height decx decy |
	
	font := aTextElement fontIfAbsent: aPage styleSheet.
	
	width := font getStringWidth: aTextElement text into: (aPage document).
	height := (font scaledFontSize: aPage document scaleFactor) roundDownTo: 0.001.
	
	"determining the horizontal offset"
	(self alignment = #RIGHT) 
			ifTrue: [ decx := self wh x - width ] 
			ifFalse: [ 
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := 0 ] 
			].
	
	"determining the vertical offset"
	(self verticalAlignment = #BOTTOM)
		ifTrue: [ decy := self wh y - height ]
		ifFalse: [ 
				(self verticalAlignment = #MIDDLE) ifTrue: [ decy := ((self wh y - height) / 2) ] ifFalse: [ decy := 0 ]
			].
	
	"(aTextElement xy: ( decx + self xy x)@((self xy y + (self wh y) + (font scaledFontSize: aPage document scaleFactor)) roundDownTo: 0.001)). "
	aTextElement xy: ( decx + self xy x)@((self xy y + height + decy)) 
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
