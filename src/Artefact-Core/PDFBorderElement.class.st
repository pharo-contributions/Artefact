"
A PDFBorderElement is basically a square with independently parametrizable #top, #bottom, #left, #right.

"
Class {
	#name : #PDFBorderElement,
	#superclass : #PDFComposite,
	#category : #'Artefact-Core-Elements-Composites'
}

{ #category : #style }
PDFBorderElement >> defaultStyle [
	^ #border
]

{ #category : #render }
PDFBorderElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	^ { (PDFRectElement from: self from to: self to) thickness: 0cm.
	(PDFLineElement from: self from x @ self from y to: self to x @ self from y style: #top).
	(PDFLineElement from: self to x @ self from y to: self to x @ self to y style: #right).
	(PDFLineElement from: self to x @ self to y to: self from x @ self to y style: #bottom).
	(PDFLineElement from: self from x @ self to y to: self from x @ self from y style: #left)}
]
