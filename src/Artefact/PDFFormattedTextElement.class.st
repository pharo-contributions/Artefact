Class {
	#name : #PDFFormattedTextElement,
	#superclass : #PDFCompositeText,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFFormattedTextElement >> determineDecxForTextStyle: aTextElement margin: aMargin with: aFont [
	"Set right x values for text"
	| width decx |
	
	self wh ifNil: [ ^ self margin ].
	
	width := aFont getStringWidth: aTextElement.
	
	"determining the horizontal offset"
	(self alignment = #RIGHT) 
			ifTrue: [ decx := self wh x - aMargin - width ] 
			ifFalse: [ 
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := aMargin ] 
			].
	^decx
]

{ #category : #render }
PDFFormattedTextElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [

	| height font decx |

	font := aStyleSheet font.
	height := font fontSize.
	decx := self determineDecxForTextStyle: (self text) margin: (self margin) with: font.

	^ {PDFTextElement new styleSheet: (self styleSheet); text: (self text); from: (decx + self from x)@(self from y + height)}
]

{ #category : #'initialize-release' }
PDFFormattedTextElement >> initialize [
	super initialize.
]
