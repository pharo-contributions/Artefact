Class {
	#name : #PDFFormatedTextStyle,
	#superclass : #PDFCompositeTextStyle,
	#instVars : [
		'textElement'
	],
	#category : #'Artefact-Styles'
}

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> determineDecxForTextStyle:  aTextElement On: aPage With: aFont [

	"Set right x values for text"
	| font width decx |
	
	width := aFont getStringWidth: aTextElement text into: (aPage document).
		
	"determining the horizontal offset"
	(self alignment = #RIGHT) 
			ifTrue: [ decx := self wh x - width ] 
			ifFalse: [ 
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := 0 ] 
			].
		
	^decx
]

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> font: aFont [
	textElement font: aFont
]

{ #category : #'as yet unclassified' }
PDFFormatedTextStyle >> getStyles [

	| height font decx |

	font := textElement fontIfAbsent: (self page styleSheet).
	height := font scaledFontSize: (self page document scaleFactor).
	
	decx := self determineDecxForTextStyle: textElement On: (self page) With: font.

	textElement xy: (decx + self xy x)@(self xy y + height).
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
