Class {
	#name : #PDFCellStyle,
	#superclass : #PDFText,
	#instVars : [
		'border',
		'linefeed',
		'alignment'
	],
	#category : #Artefact
}

{ #category : #action }
PDFCellStyle >> alignToCenter [
	self alignment: #CENTER
]

{ #category : #action }
PDFCellStyle >> alignToTheLeft [
	self alignment: #LEFT
]

{ #category : #action }
PDFCellStyle >> alignToTheRight [
	self alignment: #RIGHT
]

{ #category : #accessing }
PDFCellStyle >> alignment [
	^ alignment ifNil: [ alignment := #LEFT ]
]

{ #category : #accessing }
PDFCellStyle >> alignment: anObject [
	alignment := anObject
]

{ #category : #accessing }
PDFCellStyle >> border [
	^ border ifNil: [ border := false ]
]

{ #category : #accessing }
PDFCellStyle >> border: anObject [
	border := anObject
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
PDFCellStyle >> render: aDocument [
	| decx width cellmargin |


	(self fillColor isEmpty) ifFalse: [
		self out: (PDFRectStyle new xy: (self xy); wh: (self wh); ink: (self fillColor); fillColor: (self fillColor); render: aDocument)
	].

	self initStyle: aDocument.
	
	(self border) ifTrue: [ self out: (PDFRectStyle new xy: (self xy); wh: (self wh); ink: (self ink); render: aDocument ) ].
	
	((self text) isEmpty) ifFalse: [ 	
		decx := 0.
		width := self font getStringWidth: self text into: aDocument.
		cellmargin := aDocument margin / 10.
		(self alignment = #RIGHT) ifTrue: [ 
			decx := self wh x - cellmargin - width ] ifFalse: [
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := cellmargin ]
			].

		self out: 'BT ' , (( decx + self xy x) asString) , ' -' , ((self xy y + (0.5 * self wh y) + (0.3 * self pdfFontSize)) roundDownTo: 0.001) asString , ' Td ' , (aDocument textString: self text) , ' Tj ET'.
	].

	 ^buffer


	

]
