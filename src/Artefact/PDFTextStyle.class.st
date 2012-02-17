Class {
	#name : #PDFTextStyle,
	#superclass : #PDFText,
	#category : #Artefact
}

{ #category : #render }
PDFTextStyle >> render: aDocument [
	"Draw a text at xy position"
	
	^ ('BT ' , self xy x asString , ' -' , self xy y , ' Td (' , (self prepareText: self text) , ') Tj ET')
]
