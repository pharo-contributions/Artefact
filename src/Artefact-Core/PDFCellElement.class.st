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
	#category : #'Artefact-Core-Elements-Composites'
}

{ #category : #'instance creation' }
PDFCellElement class >> from: aPoint dimension: aDimension text: aText [ 	
	^ (self from: aPoint dimension: aDimension) text: aText 
]

{ #category : #'initialize-release' }
PDFCellElement >> defaultStyle [
	^ #cell
]

{ #category : #action }
PDFCellElement >> determineDecyForTextStyleWith: aStyleSheet [
	"Set right xy values for text"

	| decy |
	self dimension ifNil: [ ^ aStyleSheet margin ].	"determining the vertical offset"
	aStyleSheet alignment isBottom 
		ifTrue: [ decy := self dimension y - aStyleSheet margin - aStyleSheet font fontSize ]
		ifFalse: [ 
			aStyleSheet alignment isMiddle
				ifTrue: [ decy := (self dimension y - aStyleSheet font fontSize) / 2 ]
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
	^ {(PDFBorderElement from: self from dimension: dimensions).
	(PDFTextElement new
		text: self text;
		from: (decx + self from x) @ (self from y + decy))}
]
