Class {
	#name : #PDFRectStyle,
	#superclass : #PDFDraw,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFRectStyle >> renderContentOn: aPage [

	|  fill |
	
	"Draw a rectangle from xy with a specified size wh"
	(self fillColor isEmpty) ifTrue: [ fill := 'S' ] ifFalse: [ fill := 'B'].
	
	self out: (self xy x asString , ' -' , self xy y asString , ' ' , self wh x asString , ' -' , self wh y asString , ' re ' , fill).
	
	^buffer
]
