Class {
	#name : #PDFRectStyle,
	#superclass : #PDFDraw,
	#category : #Artefact
}

{ #category : #render }
PDFRectStyle >> render: aDocument [

	|  fill |
	
	self initStyle: aDocument.
	
	"Draw a rectangle from xy with a specified size wh"
	(self fillColor isEmpty) ifTrue: [ fill := 'S' ] ifFalse: [ fill := 'B'].
	
	self out: (self xy x asString , ' -' , self xy y asString , ' ' , self wh x asString , ' -' , self wh y asString , ' re ' , fill).
	
	^buffer
]
