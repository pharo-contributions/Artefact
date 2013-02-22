Class {
	#name : #PDFBezierCurveElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFBezierCurveElement >> producePageElementCodeOn: aPage [
	"Draw a Bezier curve from xy to destination (3 control points)"
	
	^ (String streamContents: [ :s |
		s nextPutAll: (self moveTo: (self from) on: aPage).
		self to do: [ :p |
			s nextPutAll: (self splitCoordinates: (self determinePosition: p on: aPage)); space. 
		].
		s nextPutAll: PDFByteCode curve; space; nextPutAll: PDFByteCode noFilling.
	]).
	
]
