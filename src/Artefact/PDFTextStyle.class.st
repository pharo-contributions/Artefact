Class {
	#name : #PDFTextStyle,
	#superclass : #PDFText,
	#category : #Artefact
}

{ #category : #render }
PDFTextStyle >> renderContentOn: aPage of: aDocument [
	"Draw a text at xy position"
		
	self out: 'BT ' , self xy x asString , ' -' , self xy y asString , ' Td ' , (aDocument textString: self text) , ' Tj ET'.
	
	^self buffer
	

]
