"
A PDFBezierCurveElement is the basic element for bezier curve.

The from position is the origin of the curve and all the points are placed relative to this origin.

Instance Variables

"
Class {
	#name : #PDFBezierCurveElement,
	#superclass : #PDFDraw,
	#instVars : [
		'points'
	],
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #'instance creation' }
PDFBezierCurveElement class >> from: aPosition points: anArrayOfPoints [
	"Positions of points are relative to aPosition"
	^ (self from: aPosition) points: anArrayOfPoints
]

{ #category : #accessing }
PDFBezierCurveElement >> points [
	^ points
]

{ #category : #accessing }
PDFBezierCurveElement >> points: anObject [
	points := anObject
]

{ #category : #render }
PDFBezierCurveElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: anObject [
	"Draw a Bezier curve from xy to destination (3 control points)"

	^ String
		streamContents: [ :s | 
			s nextPutAll: (self moveTo: self from with: aPDFGenerator).
			self points
				do: [ :p | 
					s
						nextPutAll: (self splitCoordinates: (aPDFGenerator determinePositionOnCurrentPage: self from + p));
						space ].
			s
				nextPutAll: PDFByteCode curve;
				space;
				nextPutAll: PDFByteCode noFilling ]
]

{ #category : #accessing }
PDFBezierCurveElement >> requiredAttributes [
	^ #( from points )
]
