Class {
	#name : #PDFLineStyle,
	#superclass : #PDFDraw,
	#category : #Artefact
}

{ #category : #render }
PDFLineStyle >> renderContentOn: aDocument [
	"Draw a line from xy to destination"
			
	self out: (self xy x asString , ' -' , self xy y asString , ' m ' , self destination x asString , ' -' , self destination y asString , ' l S').
	
	^buffer
]
