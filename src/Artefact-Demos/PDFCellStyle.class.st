Class {
	#name : #PDFCellStyle,
	#superclass : #PDFFormatedTextStyle,
	#instVars : [
		'linefeed',
		'rectElement'
	],
	#category : #'Artefact-Styles'
}

{ #category : #'as yet unclassified' }
PDFCellStyle >> determineDecyForTextStyleOn: aPage With: aFont [

	"Set right xy values for text"
	| height decy |

	height := aFont scaledFontSize: aPage document scaleFactor.
	
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
	rectElement dotted: anObject
]

{ #category : #accessing }
PDFCellStyle >> drawColor: aColor [
	rectElement drawColor: aColor
]

{ #category : #accessing }
PDFCellStyle >> fillColor: aColor [
	rectElement fillColor: aColor
]

{ #category : #render }
PDFCellStyle >> getStyles [
	
	"get the current position in the page if xy is not defined"
	| decx decy font |
	(self xy isNil) ifTrue: [ self xy: self page xy ] ifFalse: [ self page xy: self xy ].
	
	"set the position of the text element"
	font := textElement fontIfAbsent: (self page) styleSheet.
	decx := self determineDecxForTextStyle: textElement On: (self page) With: font.
	decy := self determineDecyForTextStyleOn: (self page) With: font. 

	textElement xy: (decx + self xy x)@(self xy y + decy).
	
	"set the new current position and linefeed ?"
 	self page lasth: self wh y.	
	(self linefeed) 
		ifTrue: [ self page xy: (self page margins x) @ (self page xy y + self wh y) ] 
		ifFalse: [ self page xy: (self page xy x + self wh x) @ (self page xy y) ].
	
	"answer the style description"	
	^ OrderedCollection new 
		add: (rectElement xy: self xy; wh: self wh); 
		add: textElement; 
		yourself.
]

{ #category : #'initialize-release' }
PDFCellStyle >> initialize [
	super initialize.
	rectElement := PDFRectStyle new.
]

{ #category : #accessing }
PDFCellStyle >> linefeed [
	^ linefeed ifNil: [ linefeed := false ]
]

{ #category : #accessing }
PDFCellStyle >> linefeed: anObject [
	linefeed := anObject
]

{ #category : #render }
PDFCellStyle >> renderContentOn: aPage [
	| decx width cellmargin cellBackground font |

	"WARNING - NOT USED"
	
	(self xy isNil) ifTrue: [ self xy: aPage xy ] ifFalse: [ aPage xy: self xy ].
	"self drawBox: aPage."

	font := (self styleSheet get: #font ifAbsentFrom: aPage document styleSheet).
	
	((self text) isEmpty) ifFalse: [ 	
		decx := 0.
		width := font getStringWidth: self text into: (aPage document).
		(self border) 
			ifTrue: [ cellmargin := (aPage format leftMargin) / 10 ] 
			ifFalse: [ cellmargin := 0 ].
		(self alignment = #RIGHT) 
			ifTrue: [ decx := self wh x - cellmargin - width ] 
			ifFalse: [ 
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := cellmargin ] 
			].
	
	self out: (PDFTextStyle new xy: ( decx + self xy x)@((self xy y + (0.5 * self wh y) + (0.3 * (font scaledFontSize: aPage document scaleFactor))) roundDownTo: 0.001); 
		textColor:  (self styleSheet get: #textColor ifAbsentFrom: (aPage document styleSheet));
		fillColor: (self styleSheet get: #fillColor ifAbsentFrom: (aPage document styleSheet));
		font: (self styleSheet get: #font ifAbsentFrom: (aPage document styleSheet));
		text: self text).
	].

	"set the new current position and linefeed ?"
	aPage lasth: self wh y.	

	(self linefeed) 
		ifTrue: [ 	
			aPage xy: (aPage margins x) @ (aPage xy y + self wh y).
		 ] 
		ifFalse: [ aPage xy: (aPage xy x + self wh x) @ (aPage xy y) ].
	
	 ^self buffer


	

]

{ #category : #accessing }
PDFCellStyle >> thickness: aThickness [
	rectElement thickness: aThickness 
]

{ #category : #accessing }
PDFCellStyle >> wh [
	"answer the with of the string if wh isn't defined"
	| font width height |
	
	^wh ifNil: [
		font := textElement fontIfAbsent: ((self page document) styleSheet).
		width := font getStringWidth: (textElement text) into: (self page document).
		height := (font scaledFontSize: (self page) document scaleFactor) roundDownTo: 0.001.
		wh :=  width@height
	]

]
