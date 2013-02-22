Class {
	#name : #PDFLineFeedElement,
	#superclass : #PDFLayout,
	#category : #'Artefact-Elements'
}

{ #category : #render }
PDFLineFeedElement >> generateCodeSegmentWithParent: aPage [
	aPage from: aPage margins x @ aPage from y.
	(self height isNil) 
		ifTrue: [ aPage from: aPage from x @ (aPage from y + aPage lasth)] 
		ifFalse: [ aPage from: aPage from x @ aPage from y + self height ].
	
	^''
]
