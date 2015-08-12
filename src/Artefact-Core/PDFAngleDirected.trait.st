"
A PDFAngleDirected is a trait to allow creation of the element from an angle and a distance.

"
Trait {
	#name : #PDFAngleDirected,
	#category : #'Artefact-Core-Elements'
}

{ #category : #'as yet unclassified' }
PDFAngleDirected classSide >> from: from angle: angle length: aLength [
	^ self from: from to: from + ((angle cos * aLength) @ (angle sin * aLength))
]
