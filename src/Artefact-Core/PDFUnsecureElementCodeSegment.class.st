"
A PDFUnsecureElementCodeSegment is a code segment produced from a PDFUnsecureBasicElement. It will be considered as dangerous for the final result and have a special treatment to not alter other code segments.

Instance Variables

"
Class {
	#name : #PDFUnsecureElementCodeSegment,
	#superclass : #PDFElementCodeSegment,
	#category : #'Artefact-Core-CodeSegment'
}

{ #category : #testing }
PDFUnsecureElementCodeSegment >> isSecure [
	^ false
]
