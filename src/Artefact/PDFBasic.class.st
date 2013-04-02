"
A PDFBasic is the superclass for all elements directly implemented in PDF like lines, text... If you want to create a new PDFBasic look at PDFUnsecureBasic.

Instance Variables

"
Class {
	#name : #PDFBasic,
	#superclass : #PDFElement,
	#instVars : [
		'rotation'
	],
	#category : #'Artefact-Elements'
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
PDFBasic >> generateCodeSegmentWith: aPDFGenerator styleSheet: aStyleSheet [
	"generate a CodeSegment based on the addition of the received stylesheet and the element styleSheet (prioritary)"

	| mixedStyleSheet |
	mixedStyleSheet := aStyleSheet + self styleSheet.
	^ self codeSegmentClass
		code: (self producePageElementCodeWith: aPDFGenerator StyleSheet: mixedStyleSheet)
		styleSheet: mixedStyleSheet
		isDrawElement: self isDrawElement
		fontId: ([(aPDFGenerator getFontIdFor: mixedStyleSheet font)] on: KeyNotFound do: [nil])
]

{ #category : #action }
PDFBasic >> isDrawElement [
	^ self subclassResponsibility 
]

{ #category : #render }
PDFBasic >> producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet [
	self subclassResponsibility 
]

{ #category : #accessing }
PDFBasic >> rotation [	
	^rotation
]

{ #category : #accessing }
PDFBasic >> rotation: aAngle [
	rotation := aAngle
]

{ #category : #action }
PDFBasic >> splitCoordinates: aPosition [
	"Answer a formated string with x and y"
	^(String streamContents: [ :s | s print: aPosition x; space; print: aPosition y ])
]
