Class {
	#name : #PDFCellStyle,
	#superclass : #PDFFormatedTextStyle,
	#instVars : [
		'linefeed',
		'rectElement'
	],
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFCellStyle >> alignment [
	^ alignment ifNil: [ alignment := #CENTER ]
]

{ #category : #action }
PDFCellStyle >> cellmargin [
	"answer the cell margin"
	
	^self page format leftMargin / 10.
]

{ #category : #action }
PDFCellStyle >> determineDecyForTextStyleWith: aFont [

	"Set right xy values for text"
	| height decy |

	height := (aFont scaledFontSize: (self page document scaleFactor)).
	
	"determining the vertical offset"
	(self verticalAlignment = #BOTTOM)
		ifTrue: [ decy := self wh y ]
		ifFalse: [ 
				(self verticalAlignment = #MIDDLE) ifTrue: [ decy := (self wh y  * 0.5) + (height * 0.3) ] ifFalse: [ decy := height ]
			].

	^decy 
]

{ #category : #accessing }
PDFCellStyle >> dotted: anObject [
	self styleSheet dotted: anObject 
]

{ #category : #accessing }
PDFCellStyle >> drawColor: aColor [
	self styleSheet drawColor: aColor
]

{ #category : #accessing }
PDFCellStyle >> fillColor: aColor [
	self styleSheet fillColor: aColor
]

{ #category : #render }
PDFCellStyle >> getStyles [
	
	"get the current position in the page if xy is not defined"
	| decx decy font |

	(self xy isNil) ifTrue: [ self xy: self page xy ] ifFalse: [ self page xy: self xy ].
	
	"set the position of the text element"
	font := self fontIfAbsent: (self page styleSheet).

	decx := self determineDecxForTextStyle: (self text) margin: (self cellmargin) with: font.
	decy := self determineDecyForTextStyleWith: font. 
	
	"set the new current position and linefeed ?"
 	self page lasth: self wh y.	
	(self linefeed) 
		ifTrue: [ self page xy: (self page margins x) @ (self page xy y + self wh y) ] 
		ifFalse: [ self page xy: (self page xy x + self wh x) @ (self page xy y) ].
	
	"answer the style description"	

	^ OrderedCollection new 
		add: (rectElement styleSheet: (self styleSheet); xy: self xy; wh: self wh); 
		add: (PDFTextStyle new styleSheet: (self styleSheet); text: (self text); xy: (decx + self xy x)@(self xy y + decy));  
		yourself.
]

{ #category : #'initialize-release' }
PDFCellStyle >> initialize [
	super initialize.
	rectElement := PDFFilledRectStyle new.
]

{ #category : #accessing }
PDFCellStyle >> linefeed [
	^ linefeed ifNil: [ linefeed := false ]
]

{ #category : #accessing }
PDFCellStyle >> linefeed: anObject [
	linefeed := anObject
]

{ #category : #accessing }
PDFCellStyle >> thickness: aThickness [
	self styleSheet thickness: aThickness 
 
]

{ #category : #accessing }
PDFCellStyle >> verticalAlignment [
	^ verticalAlignment ifNil: [ verticalAlignment := #MIDDLE ]
]

{ #category : #accessing }
PDFCellStyle >> wh [
	"answer the with of the string if wh isn't defined"
	| font width height |
	
	^wh ifNil: [
		font := self fontIfAbsent: (self page styleSheet).
		width := (font getStringWidth: (self text) into: (self page document)) + (self cellmargin * 2).
		height := (font scaledFontSize: (self page) document scaleFactor) roundDownTo: 0.001.
		wh :=  width@height
	]

]
