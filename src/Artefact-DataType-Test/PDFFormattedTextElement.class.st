Class {
	#name : #PDFFormattedTextElement,
	#superclass : #PDFCompositeText,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFFormattedTextElement >> determineDecxForTextStyle: aTextElement margin: aMargin with: aFont [
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
PDFFormattedTextElement >> getSubElements [

	| height font decx |

	font := self fontIfAbsent: (self page styleSheet).
	height := font scaledFontSize: (self page document scaleFactor).
	
	decx := self determineDecxForTextStyle: (self text) margin: (self margin) with: font.

	^ {PDFTextElement new styleSheet: (self styleSheet); text: (self text); from: (decx + self from x)@(self from y + height)}
]

{ #category : #'initialize-release' }
PDFFormattedTextElement >> initialize [
	super initialize.
]
