Class {
	#name : #PDFPageElement,
	#superclass : #PDFElement,
	#instVars : [
		'styleSheet'
	],
	#category : #'Artefact-Elements'
}

{ #category : #'initialize-release' }
PDFPageElement >> initialize [ 
	super initialize.
	self styleSheet: PDFStyleSheet new.
	
]

{ #category : #render }
PDFPageElement >> producePageElementCodeOn: aPage [
	self subclassResponsibility 
]

{ #category : #render }
PDFPageElement >> renderContentOn: aPage [
	^ PDFPageElementCodeSegment code: (self producePageElementCodeOn: aPage) styleSheet: self styleSheet isDrawElement: self isDrawElement
]

{ #category : #accessing }
PDFPageElement >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFPageElement >> styleSheet: anObject [
	styleSheet := anObject
]
