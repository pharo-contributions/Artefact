Class {
	#name : #PDFTextStyle,
	#superclass : #PDFText,
	#category : #Artefact
}

{ #category : #render }
PDFTextStyle >> render: aDocument [
	"Draw a text at xy position"
		
	self initStyle: aDocument.
	self out: 'BT ' , self xy x asString , ' -' , self xy y asString , ' Td ' , (aDocument textString: self text) , ' Tj ET'.
	
	^buffer
	

]
