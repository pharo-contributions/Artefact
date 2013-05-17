"
A PDFCellElement is a formatted text element drawed in a rectangle.

Styles hierarchy:
#cell
#cell > #text
#cell > #border

"
Class {
	#name : #PDFCellElement,
	#superclass : #PDFFormattedTextElement,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #'initialize-release' }
PDFCellElement >> defaultStyle [
	^ #cell
]

{ #category : #action }
PDFCellElement >> determineDecyForTextStyleWith: aStyleSheet [
	"Set right xy values for text"

	| decy |
	self wh ifNil: [ ^ aStyleSheet margin ].	"determining the vertical offset"
	aStyleSheet alignment isBottom 
		ifTrue: [ decy := self wh y - aStyleSheet margin - aStyleSheet font fontSize ]
		ifFalse: [ 
			aStyleSheet alignment isMiddle
				ifTrue: [ decy := (self wh y - aStyleSheet font fontSize) / 2 ]
				ifFalse: [ decy := aStyleSheet margin ] ].
	^ decy
]

{ #category : #render }
PDFCellElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"get the current position in the page if xy is not defined"

	| decx decy dimensions |
	"set the position of the text element"
	dimensions := self minimumDimensionWith: aPDFGenerator styleSheet: aStyleSheet.
	decx := self determineDecxForTextStyle: self text styleSheet: aStyleSheet.
	decy := self determineDecyForTextStyleWith: aStyleSheet.
	^ {(PDFRectElement new
		from: self from;
		wh: dimensions;
		style: #border).
	(PDFTextElement new
		text: self text;
		from: (decx + self from x) @ (self from y + decy))}
]
