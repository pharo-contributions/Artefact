"
A PDFUnsecureBasic is the class you should inherit from if you want to directly insert PDF code into your document. This code will be considered as unsecure to protect other PDFElement. You will benefit automatically from stylesheets for colors, thickness...

You have to implement:
-producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet (must return a String representation of your pdf code)
-isDrawElement (Artefact use differents colors parameters to distinguish text and draw elements but pdf only have one for both)

Instance Variables

"
Class {
	#name : #PDFUnsecureBasic,
	#superclass : #PDFBasic,
	#category : #'Artefact-Core-Elements'
}

{ #category : #accessing }
PDFUnsecureBasic >> codeSegmentClass [
	^ PDFUnsecureElementCodeSegment 
]
