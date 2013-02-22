Class {
	#name : #PDFPolygonElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Elements-Basic'
}

{ #category : #render }
PDFPolygonElement >> fillmode [
	^ PDFByteCode noFilling
]

{ #category : #render }
PDFPolygonElement >> producePageElementCodeOn: aPage [
	"Draw a polygon from xy to destination (a array of positions)"
	
	| points |
	
	points := OrderedCollection new 
		addAll: (self to collect: [ :position |
			self determinePosition: position on: aPage
		]);
		add: (self determinePosition: self from on: aPage);
		yourself.
	
	^ (String streamContents: [ :s |
		s nextPutAll: (self moveTo: self from on: aPage).
		points do: [ :pos | 
			s nextPutAll: (self splitCoordinates: pos);
			space;
			nextPutAll: PDFByteCode line;
			space
		].
		s nextPutAll: (self fillmode)
	]).
]
