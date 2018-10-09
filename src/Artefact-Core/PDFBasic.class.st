"
A PDFBasic is the superclass for all elements directly implemented in PDF like lines, text... If you want to create a new PDFBasic look at PDFUnsecureBasic.

Instance Variables

"
Class {
	#name : #PDFBasic,
	#superclass : #PDFElement,
	#category : #'Artefact-Core-Elements'
}

{ #category : #render }
PDFBasic >> codeSegmentClass [
	^ PDFElementCodeSegment
]

{ #category : #action }
PDFBasic >> determinePosition: aPosition on: aPage [
	"answer the real position of the PDF element on the page"
	
	^(aPage document convertToPoints: aPosition x) @ ((aPage format defaultSize y) - (aPage document convertToPoints: aPosition y))
]

{ #category : #render }
PDFBasic >> generateCodeSegmentWith: aPDFGenerator styleSheet: aStyleSheet format: aFormat [

	^ self codeSegmentClass
		code: (self producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet)
		styleSheet: aStyleSheet
		format: aFormat
		isDrawElement: self isDrawElement
		fontId: ([(aPDFGenerator getFontIdFor: aStyleSheet font)] on: KeyNotFound do: [nil])
		opacityId: ([(aPDFGenerator getOpacityIdFor: aStyleSheet opacity)] on: KeyNotFound do: [nil])
		fromElement: self
]

{ #category : #action }
PDFBasic >> isDrawElement [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PDFBasic >> opacity: anOpacity [
	self styleSheet opacity: anOpacity 
]

{ #category : #render }
PDFBasic >> producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet [
	self subclassResponsibility 
]

{ #category : #action }
PDFBasic >> splitCoordinates: aPosition [
	"Answer a formated string with x and y"
	^(String streamContents: [ :s | s print: aPosition x; space; print: aPosition y ])
]
