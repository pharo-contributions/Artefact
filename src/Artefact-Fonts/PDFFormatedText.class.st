Class {
	#name : #PDFFormatedText,
	#superclass : #PDFText,
	#instVars : [
		'border',
		'alignment'
	],
	#category : #'Artefact-Styles'
}

{ #category : #action }
PDFFormatedText >> alignToCenter [
	self alignment: #CENTER
]

{ #category : #action }
PDFFormatedText >> alignToTheLeft [
	self alignment: #LEFT
]

{ #category : #action }
PDFFormatedText >> alignToTheRight [
	self alignment: #RIGHT
]

{ #category : #accessing }
PDFFormatedText >> alignment [
	^ alignment ifNil: [ alignment := #LEFT ]
]

{ #category : #accessing }
PDFFormatedText >> alignment: anObject [
	alignment := anObject
]

{ #category : #accessing }
PDFFormatedText >> border [
	^ border ifNil: [ border := false ]
]

{ #category : #accessing }
PDFFormatedText >> border: anObject [
	border := anObject
]

{ #category : #private }
PDFFormatedText >> drawBox [
	"Draw a box (with fill color) around the text"
	| cellBackground |
	
	(self border) ifTrue: [
		cellBackground := (PDFRectStyle new xy: (self xy); wh: (self wh); ink: (self ink)).
		(self fillColor isEmpty) ifFalse: [ cellBackground fillColor: (self fillColor) ].
		self out: cellBackground.	
	].
]
