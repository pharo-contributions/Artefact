Class {
	#name : #PDFPolygonStyle,
	#superclass : #PDFDraw,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFPolygonStyle >> fillmode [
	^ 'S'
]

{ #category : #render }
PDFPolygonStyle >> renderContentOn: aPage [
	"Draw a polygon from xy to destination (a array of positions)"
	
	| origin points |
	
	origin := (self userUnitToPoints: self xy x into: aPage document) @ ((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document)).
	self out: (origin x asString , ' ' , origin y asString , ' m ').
		
	points := OrderedCollection new 
		addAll: (self destination collect: [ :pos | 
			(self userUnitToPoints: pos x into: aPage document) @ ((aPage format defaultSize y) - (self userUnitToPoints: pos y into: aPage document))
		]);
		add: origin;
		yourself.
	
	points do: [ :pos | self out: (pos x asString , ' ' , pos y asString , ' l ') ].
	self out: (self fillmode). 

	^buffer
]
