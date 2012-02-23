Class {
	#name : #PDFLineStyle,
	#superclass : #PDFDraw,
	#category : #Artefact
}

{ #category : #render }
PDFLineStyle >> render: aDocument [
	"Draw a line from xy to destination"
	
	self initDrawStyle: aDocument.
		
	buffer add: (self xy x asString , ' -' , self xy y asString , ' m ' , self destination x asString , ' -' , self destination y asString , ' l S').
	
	^buffer
]
