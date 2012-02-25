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
	| size decx width cellmargin |

	self initStyle: aDocument.
	
	size := (self font fontSize / aDocument scaleFactor) roundDownTo: 0.01.	

	aDocument fonts at: (self font fontName) ifAbsent: [ aDocument fonts at: self font fontName put: ((aDocument fonts size) + 1) ].
	self out: 'BT /F', (aDocument fonts at: (self font fontName)) asString , ' ' , (size asString) , ' Tf ET'.

	(self border) ifTrue: [ self out: (xy x asString) , ' -' , (self xy y asString) , ' ' , (self wh x asString), ' -' , (self wh y asString) , ' re S' ].

	((self text) isEmpty) ifFalse: [ 	
		decx := 0.
		width := self font getStringWidth: self text into: aDocument.
		cellmargin := aDocument margin / 10.
		(self alignment = #RIGHT) ifTrue: [ 
			decx := self wh x - cellmargin - width ] ifFalse: [
				(self alignment = #CENTER) ifTrue: [ decx := ((self wh x - width) / 2) ] ifFalse: [ decx := cellmargin ]
			].
		self out: 'BT ' , (( decx + self xy x) asString) , ' -' , ((self xy y + (0.5 * self wh y) + (0.3 * size)) roundDownTo: 0.001) asString , ' Td ' , (aDocument textString: self text) , ' Tj ET'.
	].

	 ^buffer


	

]
