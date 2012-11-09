Class {
	#name : #PDFBezierCurveStyle,
	#superclass : #PDFDraw,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFBezierCurveStyle >> renderContentOn: aPage [
	"Draw a Bezier curve from xy to destination (3 control points)"

	self out: (String streamContents: [ :s |
		s print: (self userUnitToPoints: self xy x into: aPage document);
		space;
		print: ((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document));
		nextPutAll: ' m '.
		self destination do: [ :p | 
			s print: (self userUnitToPoints: p x into: aPage document);
			space;
			print: ((aPage format defaultSize y) - (self userUnitToPoints: p y into: aPage document));
			space
		].
		s nextPutAll: PDFByteCode curve; space; nextPutAll: PDFByteCode noFilling.
	]).
	
	^buffer
]
