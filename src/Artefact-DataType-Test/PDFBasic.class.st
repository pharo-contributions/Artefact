Class {
	#name : #PDFBasic,
	#superclass : #PDFVisibleItem,
	#category : #'Artefact-Elements'
}

{ #category : #action }
PDFBasic >> determinePosition: aPosition on: aPage [
	"answer the real position of the PDF element on the page"
	
	^(aPage document convertToPoints: aPosition x) @ ((aPage format defaultSize y) - (aPage document convertToPoints: aPosition y))
]

{ #category : #render }
PDFBasic >> generateCodeSegmentArrayIn: aPage [
	"initialize the style and answer the style content. The style receive the document context and the current page"

	^ {(PDFElementCodeSegment code: (self producePageElementCodeOn: aPage) styleSheet: self styleSheet)}
]

{ #category : #action }
PDFBasic >> isDrawElement [
	^ SubclassResponsibility 
]

{ #category : #render }
PDFBasic >> producePageElementCodeOn: aPage [
	self subclassResponsibility 
]

{ #category : #action }
PDFBasic >> splitCoordinates: aPosition [
	"Answer a formated string with x and y"
	^(String streamContents: [ :s | s print: aPosition x; space; print: aPosition y ])
]
