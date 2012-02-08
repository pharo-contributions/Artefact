Class {
	#name : #PDFRectStyle,
	#superclass : #PDFStyle,
	#category : #Artefact
}

{ #category : #render }
PDFRectStyle >> render [
	"Draw a rectangle from xy with a specified size wh"
	^ (self xy x asString , ' -' , self xy y asString , ' ' , self wh x asString , ' -' , self wh y asString , ' re S').
]
