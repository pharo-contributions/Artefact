Class {
	#name : #PDFFormatedTextStyle,
	#superclass : #PDFCompositeText,
	#category : #'Artefact-Styles'
}

{ #category : #action }
PDFFormatedTextStyle >> determineDecxForTextStyle: aTextElement margin: aMargin with: aFont [
	"Set right x values for text"
	| font width decx |
	
	width := aFont getStringWidth: aTextElement into: (self page document).
	
	"determining the horizontal offset"
	(self alignment = #RIGHT) 
			ifTrue: [ decx := self wh x - aMargin - width ] 
			ifFalse: [ 
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := aMargin ] 
			].
	^decx
]

{ #category : #render }
PDFFormatedTextStyle >> getStyles [

	| height font decx |

	font := self fontIfAbsent: (self page styleSheet).
	height := font scaledFontSize: (self page document scaleFactor).
	
	decx := self determineDecxForTextStyle: (self text) margin: (self margin) with: font.

	^ {PDFTextStyle new styleSheet: (self styleSheet); text: (self text); xy: (decx + self xy x)@(self xy y + height)}
]

{ #category : #'initialize-release' }
PDFFormatedTextStyle >> initialize [
	super initialize.
]
