Class {
	#name : #PDFCellElement,
	#superclass : #PDFFormattedTextElement,
	#category : #'Artefact-Elements-Composites'
}

{ #category : #accessing }
PDFCellElement >> alignment [
	^ alignment ifNil: [ alignment := #CENTER ]
]

{ #category : #style }
PDFCellElement >> defaultMargin [
	^ 1 point
]

{ #category : #action }
PDFCellElement >> determineDecyForTextStyleWith: aFont [
	"Set right xy values for text"

	| decy |
	self wh ifNil: [ ^ self margin ].	"determining the vertical offset"
	self verticalAlignment = #BOTTOM
		ifTrue: [ decy := self wh y - self margin - aFont fontSize ]
		ifFalse: [ 
			self verticalAlignment = #MIDDLE
				ifTrue: [ decy := (self wh y - aFont fontSize) / 2 ]
				ifFalse: [ decy := self margin ] ].
	^ decy
]

{ #category : #render }
PDFCellElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"get the current position in the page if xy is not defined"

	| decx decy font dimensions |
	"set the position of the text element"
	font := aStyleSheet font.
	dimensions := self minimumDimensionWith: aPDFGenerator styleSheet: aStyleSheet.
	decx := self determineDecxForTextStyle: self text margin: self margin with: font.
	decy := self determineDecyForTextStyleWith: font.
	^ {(PDFRectElement new
		styleSheet: aStyleSheet;
		filled: self filled;
		from: self from;
		wh: dimensions).
	(PDFTextElement new
		styleSheet: aStyleSheet;
		text: self text;
		from: (decx + self from x) @ (self from y + decy))}
]

{ #category : #accessing }
PDFCellElement >> verticalAlignment [
	^ verticalAlignment ifNil: [ verticalAlignment := #MIDDLE ]
]
