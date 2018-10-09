"
A PDFPolygonElement is  the basic element for polygons.

Instance Variables

"
Class {
	#name : #PDFPolygonElement,
	#superclass : #PDFDraw,
	#instVars : [
		'points'
	],
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #'instance creation' }
PDFPolygonElement class >> from: aPosition points: anArrayOfPoints [
	^(self from: aPosition) points: anArrayOfPoints 
]

{ #category : #accessing }
PDFPolygonElement >> points [
	^ points
]

{ #category : #accessing }
PDFPolygonElement >> points: anObject [
	points := anObject
]

{ #category : #render }
PDFPolygonElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet [
	"Draw a polygon from xy to destination (a array of positions)"

	^ String
		streamContents: [ :s | 
			s nextPutAll: (self moveTo: self from with: aPDFGenerator).
			self points , {self points first}
				do: [ :p | 
					s
						nextPutAll: (self splitCoordinates: (aPDFGenerator determinePositionOnCurrentPage: self from + p));
						space.
					s
						nextPutAll: PDFByteCode line;
						space ].
			s
				nextPutAll: (self fillMode: aStyleSheet filled);
				space ]
]

{ #category : #checking }
PDFPolygonElement >> requiredAttributes [
	^ #( from points )
]
