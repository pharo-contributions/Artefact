Class {
	#name : #PDFCellStyle,
	#superclass : #PDFCompositeStyle,
	#instVars : [
		'linefeed'
	],
	#category : #'Artefact-Styles'
}

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
