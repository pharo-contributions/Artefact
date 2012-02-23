Class {
	#name : #PDFCellStyle,
	#superclass : #PDFText,
	#instVars : [
		'border',
		'linefeed'
	],
	#category : #Artefact
}

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
	| buffer size |
	
	buffer := OrderedCollection new.

	size := (self font fontSize / aDocument scaleFactor) roundDownTo: 0.01.	

	aDocument fonts at: (self font fontName) ifAbsent: [ aDocument fonts at: self font fontName put: ((aDocument fonts size) + 1) ].
	buffer add: 'BT /F', (aDocument fonts at: (self font fontName)) asString , ' ' , (size asString) , ' Tf ET'.

	(self border) ifTrue: [ buffer add: (xy x asString) , ' -' , (self xy y asString) , ' ' , (self wh x asString), ' -' , (self wh y asString) , ' re S' ].

	((self text) isEmpty) ifFalse: [ 	
		buffer add: 'BT ' , (self xy x asString) , ' -' , ((self xy y + (0.5 * self wh y) + (0.3 * size)) roundDownTo: 0.001) asString , ' Td ' , (aDocument textString: self text) , ' Tj ET'.
	].

	 ^buffer
	

	

]
