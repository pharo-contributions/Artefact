Class {
	#name : #PDFPageElement,
	#superclass : #PDFElement,
	#instVars : [
		'styleSheet'
	],
	#category : #'Artefact-Elements'
}

{ #category : #render }
PDFPageElement >> generateCodeSegmentWithParent: aPage [
	^ PDFPageElementCodeSegment code: (self producePageElementCodeOn: aPage) styleSheet: self styleSheet isDrawElement: self isDrawElement
]

{ #category : #'initialize-release' }
PDFPageElement >> initialize [ 
	super initialize.
	self styleSheet: PDFStyleSheet new.
	
]

{ #category : #render }
PDFPageElement >> producePageElementCodeOn: aPage [
	self subclassResponsibility 
]

{ #category : #accessing }
PDFPageElement >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFPageElement >> styleSheet: anObject [
	styleSheet := anObject
]