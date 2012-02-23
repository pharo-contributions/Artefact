Class {
	#name : #PDFRectStyle,
	#superclass : #PDFDraw,
	#category : #Artefact
}

{ #category : #render }
PDFRectStyle >> render: aDocument [

	self initStyle: aDocument.
	
	"Draw a rectangle from xy with a specified size wh"
	^ (self xy x asString , ' -' , self xy y asString , ' ' , self wh x asString , ' -' , self wh y asString , ' re S').
]
