Class {
	#name : #PDFCircleStyle,
	#superclass : #PDFDraw,
	#instVars : [
		'radius'
	],
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFCircleStyle >> fillmode [
	^ 'S'
]

{ #category : #accessing }
PDFCircleStyle >> radius [
	^radius
]

{ #category : #accessing }
PDFCircleStyle >> radius: aValue [
	radius := aValue
]

{ #category : #render }
PDFCircleStyle >> renderContentOn: aPage [
	"Draw a line from xy to destination"
	| origin r |
	
	origin := (self userUnitToPoints: self xy x into: aPage document) @ ((aPage format defaultSize y) - (self userUnitToPoints: self xy y into: aPage document)).
	r := self userUnitToPoints: self radius into: aPage document.
	 
	self out: (
		(origin x + r) asString , ' ' , origin y asString , ' m ' ,
		(origin x + r) asString , ' ' , ((r * 0.552) + origin y) asString , ' ' ,
		((r * 0.552) + origin x) asString , ' ' , (origin y + r) asString , ' ' ,
		origin x asString , ' ' , (origin y + r) asString , ' c ' ,
		((-0.552 * r) + origin x) asString , ' ' , (origin y + r) asString , ' ' ,
		(origin x - r) asString , ' ' , ((r * 0.552) + origin y) asString , ' ' ,
		(origin x - r) asString , ' ' , origin y asString , ' c ' ,
		(origin x - r) asString ,' ' , ((-0.552 * r) + origin y) asString , ' ' ,
		((-0.552 * r) + origin x) asString , ' ' , (origin y - r) asString , ' ' ,
		origin x asString , ' ' , (origin y - r) asString , ' c ' ,
		((0.552 * r) + origin x) asString , ' ' , (origin y - r) asString , ' ' ,
		(origin x + r) asString , ' ' , ((-0.552 * r) + origin y) asString , ' ' ,
		(origin x + r) asString , ' ' , origin y asString ,' c h ' ,
		self fillmode
		).	
	^buffer
]
