Class {
	#name : #PDFLineStyle,
	#superclass : #PDFDraw,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFLineStyle >> renderContentOn: aPage [
	"Draw a line from xy to destination"
			
	self out: (
		(self userUnitToPoints: self xy x into: aPage document) asString , 
		' ' , 
		((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document)) asString , 
		' m ' , 
		(self userUnitToPoints: self destination x into: aPage document) asString , 
		' ' , 
		((aPage format defaultSize y) - (self userUnitToPoints: self destination y into: aPage document)) asString , 
		' l S').

	^buffer
]
