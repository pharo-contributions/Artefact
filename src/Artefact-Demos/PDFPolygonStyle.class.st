Class {
	#name : #PDFPolygonStyle,
	#superclass : #PDFDraw,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFPolygonStyle >> fillmode [
	^ PDFByteCode noFilling
]

{ #category : #render }
PDFPolygonStyle >> renderContentOn: aPage [
	"Draw a polygon from xy to destination (a array of positions)"
	
	| origin points |
	
	origin := (self userUnitToPoints: self xy x into: aPage document) @ ((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document)).
	
	points := OrderedCollection new 
		addAll: (self destination collect: [ :pos | 
			(self userUnitToPoints: pos x into: aPage document) @ ((aPage format defaultSize y) - (self userUnitToPoints: pos y into: aPage document))
		]);
		add: origin;
		yourself.
	
	self out: (String streamContents: [ :s |
		s print: origin x;
		space;
		print: origin y;
		nextPutAll: ' m '.
		points do: [ :pos | 
			s print: pos x;
			space;
			print: pos y;
			nextPutAll: ' l '
		].
		s nextPutAll: (self fillmode)
	]).
			 
	^buffer
]
