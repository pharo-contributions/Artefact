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
	| buffer |
	
	buffer := OrderedCollection new.
	
	(self border) ifTrue: [ buffer add: (xy x asString) , ' -' , (self xy y asString) , ' ' , (self wh x asString), ' -' , (self wh y asString) , ' re S' ].

	((self text) isEmpty) ifFalse: [ 	
		buffer add: 'BT ' , ((self xy x + (0.15 * aDocument currentFont fontSize)) roundDownTo: 0.001) asString , ' -' , ((self xy y + (0.5 * self wh y) + (0.3 * aDocument currentFont fontSize)) roundDownTo: 0.001) asString , ' Td (' , (aDocument escape: self text) , ') Tj ET'.
	].

	 ^buffer
	

	

]
