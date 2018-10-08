"
A PDFFormattedTextElement is an element to represent a text contained in a virtual box. the text can be positionned with differents alignments (left, middle, right) but will be displayed on one line (no carriage return).

Styles hierarchy:
#text

"
Class {
	#name : #PDFFormattedTextElement,
	#superclass : #PDFCompositeText,
	#category : #'Artefact-Core-Elements-Composites'
}

{ #category : #style }
PDFFormattedTextElement >> defaultStyle [
	^ #text
]

{ #category : #action }
PDFFormattedTextElement >> determineDecxForTextStyle: aTextElement styleSheet: aStyleSheet [
	"Set right x values for text"
	| width decx |
	
	self dimension ifNil: [ ^ aStyleSheet margin ].
	
	width := aStyleSheet font getStringWidth: aTextElement.
	
	"determining the horizontal offset"
	(aStyleSheet alignment isRight) 
			ifTrue: [ decx := self dimension x - aStyleSheet margin - width ] 
			ifFalse: [ 
				(aStyleSheet alignment isCenter) ifTrue: [ decx := ((self dimension x - width) / 2) ] ifFalse: [ decx := aStyleSheet margin ] 
			].
	^decx
]

{ #category : #render }
PDFFormattedTextElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [

	| height font decx |

	font := aStyleSheet font.
	height := font fontSize.
	decx := self determineDecxForTextStyle: (self text) styleSheet: aStyleSheet.

	^ {PDFTextElement new text: (self text); from: (decx + self from x)@(self from y + height)}
]

{ #category : #'initialize-release' }
PDFFormattedTextElement >> initialize [
	super initialize.
]
