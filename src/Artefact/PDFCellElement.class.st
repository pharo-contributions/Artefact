Class {
	#name : #PDFCellElement,
	#superclass : #PDFFormattedTextElement,
	#instVars : [
		'linefeed'
	],
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
	| height decy |
	
	height := aFont fontSize.
	
	self wh ifNil: [ ^ height - self margin ].
	
	"determining the vertical offset"
	(self verticalAlignment = #BOTTOM)
		ifTrue: [ decy := (self wh y - self margin) ]
		ifFalse: [ 
				(self verticalAlignment = #MIDDLE) ifTrue: [ decy := (self wh y  * 0.5) + (height * 0.3) ] ifFalse: [ decy := height + self margin ]
			].

	^decy 
]

{ #category : #render }
PDFCellElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	"get the current position in the page if xy is not defined"

	| decx decy font dimensions |
	"set the position of the text element"
	font := aStyleSheet font.
	dimensions := self wh
		ifNil: [ ((font getStringWidth: self text) + (2 * self margin)) @ (font fontSize + (2 * self margin)) ]
		ifNotNil: [ self wh ].
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
PDFCellElement >> linefeed [
	^ linefeed ifNil: [ linefeed := false ]
]

{ #category : #accessing }
PDFCellElement >> linefeed: anObject [
	linefeed := anObject
]

{ #category : #accessing }
PDFCellElement >> verticalAlignment [
	^ verticalAlignment ifNil: [ verticalAlignment := #MIDDLE ]
]

{ #category : #accessing }
PDFCellElement >> wh [
	^ wh
]
