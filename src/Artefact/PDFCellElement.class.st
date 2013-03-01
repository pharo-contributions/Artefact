Class {
	#name : #PDFCellElement,
	#superclass : #PDFFormattedTextElement,
	#instVars : [
		'linefeed',
		'rectElement'
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

	height := (aFont scaledFontSize: (self page document scaleFactor)).
	
	"determining the vertical offset"
	(self verticalAlignment = #BOTTOM)
		ifTrue: [ decy := (self wh y - self margin) ]
		ifFalse: [ 
				(self verticalAlignment = #MIDDLE) ifTrue: [ decy := (self wh y  * 0.5) + (height * 0.3) ] ifFalse: [ decy := height + self margin ]
			].

	^decy 
]

{ #category : #render }
PDFCellElement >> getSubElements [
	
	"get the current position in the page if xy is not defined"
	| decx decy font |

	(self from isNil) ifTrue: [ self from: self page from ] ifFalse: [ self page from: self from ].
	
	"set the position of the text element"
	font := self fontIfAbsent: (self page styleSheet).

	decx := self determineDecxForTextStyle: (self text) margin: (self margin) with: font.
	decy := self determineDecyForTextStyleWith: font. 
	
	"set the new current position and linefeed ?"
 	self page lasth: self wh y.	
	(self linefeed) 
		ifTrue: [ self page from: (self page margins x) @ (self page from y + self wh y) ] 
		ifFalse: [ self page from: (self page from x + self wh x) @ (self page from y) ].
	
	"answer the style description"	

	^ OrderedCollection new 
		add: (rectElement styleSheet: (self styleSheet); from: self from; wh: self wh); 
		add: (PDFTextElement new styleSheet: (self styleSheet); text: (self text); from: (decx + self from x)@(self from y + decy));  
		yourself.
]

{ #category : #'initialize-release' }
PDFCellElement >> initialize [
	super initialize.
	rectElement := PDFFilledRectElement new.
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
	"answer the with of the string if wh isn't defined"
	| font width height |
	
	^wh ifNil: [
		font := self fontIfAbsent: (self page styleSheet).
		width := (font getStringWidth: (self text) into: (self page document)) + (self margin * 2).
		height := (font scaledFontSize: (self page) document scaleFactor) roundDownTo: 0.001.
		wh :=  width@height
	]

]
