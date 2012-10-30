Class {
	#name : #PDFRectStyle,
	#superclass : #PDFDraw,
	#category : #'Artefact-Styles'
}

{ #category : #accessing }
PDFRectStyle >> fillmode [
	^'S'
]

{ #category : #render }
PDFRectStyle >> renderContentOn: aPage [
	
	"Draw a rectangle from xy with a specified size wh"
	
	self out: (
		(self userUnitToPoints: self xy x into: aPage document) asString , 
		' ' ,
		((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document)) asString ,
		' ' ,
		(self userUnitToPoints: self wh x into: aPage document) asString ,
		' ' ,
		((self userUnitToPoints: self wh y into: aPage document) * -1) asString,
		' re ' , self fillmode
	).	
	"self out: (self xy x asString , ' -' , self xy y asString , ' ' , self wh x asString , ' -' , self wh y asString , ' re ' , self fillmode)."
	
	^buffer
]
