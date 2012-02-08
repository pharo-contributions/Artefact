Class {
	#name : #PDFLineStyle,
	#superclass : #PDFStyle,
	#category : #Artefact
}

{ #category : #render }
PDFLineStyle >> render [
	"Draw a line from xy to destination"
	^ (self xy x asString , ' - ' , self xy y asString , ' m ' , self destination x asString , ' -' , self destination y asString , ' l S')
	
]
