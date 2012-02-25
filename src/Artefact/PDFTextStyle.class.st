Class {
	#name : #PDFTextStyle,
	#superclass : #PDFText,
	#category : #Artefact
}

{ #category : #render }
PDFTextStyle >> render: aDocument [
	"Draw a text at xy position"
	
	| size myFont |
	
	self initStyle: aDocument.
	
	size := (self font fontSize / aDocument scaleFactor) roundDownTo: 0.01.	 
	aDocument fonts at: (self font fontName) ifAbsent: [ aDocument fonts at: self font fontName put: ((aDocument fonts size) + 1) ].
	self out: 'BT /F', (aDocument fonts at: (self font fontName)) asString , ' ' , (size asString) , ' Tf ET'.
	
	self out: 'BT ' , self xy x asString , ' -' , self xy y asString , ' Td ' , (aDocument textString: self text) , ' Tj ET'.
	
	^buffer
]
