"
A basic ellipse
"
Class {
	#name : #PDFEllipseElement,
	#superclass : #PDFDraw,
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #'as yet unclassified' }
PDFEllipseElement class >> center: aPoint radius: aRadius [
	^ self from: aPoint - (aRadius @ aRadius) to: aPoint + (aRadius @ aRadius)
]

{ #category : #render }
PDFEllipseElement >> producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet [
	
	| hw hh magic cx cy lx rx ty by |

	magic := 0.551784.
	cx := aPDFGenerator convertToPoints: self center x.
	cy := aPDFGenerator convertToPoints: self center y.
	hw := 0.5*magic * (aPDFGenerator convertToPoints: self width).
	hh := 0.5*magic * (aPDFGenerator convertToPoints: self height).
	lx := aPDFGenerator convertToPoints: (self center x - (self width / 2 )).
	rx := aPDFGenerator convertToPoints: (self center x + (self width / 2 )).
	ty := aPDFGenerator convertToPoints: (self center y - (self height / 2 )).
	by := aPDFGenerator convertToPoints: (self center y + (self height / 2 )).
	
	^ (String streamContents: [ :s |
		s print: cx; space; print: ty; nextPutAll: ' m '; 
		print: cx+hw; space; print: ty; space;
		print: rx; space; print: cy-hh; space;
		print: rx; space; print: cy; nextPutAll: ' c ';
		print: rx; space; print: cy+hh; space;
		print: cx+hw; space; print: by; space;
		print: cx; space; print: by; nextPutAll: ' c ';
		print: cx-hw; space; print: by; space;
		print: lx; space; print:  cy+hh; space;
		print: lx; space; print:cy; nextPutAll: ' c ';
		print: lx; space; print: cy-hh; space;
		print: cx-hw; space; print: ty; space;
		print: cx; space; print: ty; nextPutAll: ' c h ';
		nextPutAll:( self fillMode: (aStyleSheet filled))
	]).
 	
]
