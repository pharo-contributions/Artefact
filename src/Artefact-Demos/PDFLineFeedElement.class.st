Class {
	#name : #PDFLineFeedElement,
	#superclass : #PDFLayout,
	#category : #'Artefact-Elements-Layout'
}

{ #category : #render }
PDFLineFeedElement >> renderContentOn: aPage [
	aPage xy: aPage margins x @ aPage xy y.
	(self height isNil) 
		ifTrue: [ aPage xy: aPage xy x @ (aPage xy y + aPage lasth)] 
		ifFalse: [ aPage xy: aPage xy x @ aPage xy y + self height ].
	
	^''
]
