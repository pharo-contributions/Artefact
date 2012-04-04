Class {
	#name : #PDFCellStyle,
	#superclass : #PDFFormatedText,
	#category : #Artefact
}

{ #category : #render }
PDFCellStyle >> renderContentOn: aPage [
	| decx width cellmargin cellBackground |

	
	(self xy isNil) ifTrue: [ self xy: aPage xy ] ifFalse: [ aPage xy: self xy ].
	self drawBox.

	((self text) isEmpty) ifFalse: [ 	
		decx := 0.
		width := self font getStringWidth: self text into: (aPage document).
		(self border) 
			ifTrue: [ cellmargin := (aPage format leftMargin) / 10 ] 
			ifFalse: [ cellmargin := 0 ].
		(self alignment = #RIGHT) 
			ifTrue: [ decx := self wh x - cellmargin - width ] 
			ifFalse: [ 
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := cellmargin ] 
			].

	self out: (PDFTextStyle new xy: ( decx + self xy x)@((self xy y + (0.5 * self wh y) + (0.3 * self pdfFontSize)) roundDownTo: 0.001); 
		ink: self ink;
		fillColor: self fillColor;
		font: self font;
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
