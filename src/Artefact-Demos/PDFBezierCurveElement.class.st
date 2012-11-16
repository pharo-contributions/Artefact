Class {
	#name : #PDFBezierCurveElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFBezierCurveElement >> renderContentOn: aPage [
	"Draw a Bezier curve from xy to destination (3 control points)"
	
	self out: (String streamContents: [ :s |
		s nextPutAll: (self moveTo: (self xy) on: aPage).
		self destination do: [ :p |
			s nextPutAll: (self splitCoordinates: (self determinePosition: p on: aPage)); space. 
		].
		s nextPutAll: PDFByteCode curve; space; nextPutAll: PDFByteCode noFilling.
	]).
	
	^buffer
]
