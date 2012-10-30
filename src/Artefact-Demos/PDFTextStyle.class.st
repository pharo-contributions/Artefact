Class {
	#name : #PDFTextStyle,
	#superclass : #PDFText,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFTextStyle >> renderContentOn: aPage [
	"Draw a text at xy position"
		
	self out: (
		'BT ' ,
		(self userUnitToPoints: self xy x into: aPage document) asString ,
		' ' ,
		((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document)) asString ,
		' Td ' ,
		((aPage document) textString: self text) , 
		' Tj ET'
	).	
	
	^self buffer
	

]
