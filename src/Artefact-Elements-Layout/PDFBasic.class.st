Class {
	#name : #PDFBasic,
	#superclass : #PDFVisibleItem,
	#category : #'Artefact-Elements'
}

{ #category : #action }
PDFBasic >> determinePosition: aPosition on: aPage [
	"answer the real position of the PDF element on the page"
	
	^(self userUnitToPoints: aPosition x into: aPage document) @ ((aPage format defaultSize y) - (self userUnitToPoints: aPosition y into: aPage document))
]

{ #category : #action }
PDFBasic >> splitCoordinates: aPosition [
	"Answer a formated string with x and y"
	^(String streamContents: [ :s | s print: aPosition x; space; print: aPosition y ])
]
