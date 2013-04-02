"
A PDFElement is the abstract class for each element that can be included in a PDFPage.

Instance Variables
	styleSheet:		<Object>

styleSheet
	- xxxxx

"
Class {
	#name : #PDFElement,
	#superclass : #Object,
	#instVars : [
		'styleSheet',
		'wh',
		'from'
	],
	#category : #'Artefact-Elements'
}

{ #category : #accessing }
PDFElement >> from [
	^ from
]

{ #category : #accessing }
PDFElement >> from: anObject [
	from := anObject
]

{ #category : #render }
PDFElement >> generateCodeSegmentWith: aPage styleSheet: aStyleSheet [
	^ self subclassResponsibility 
]

{ #category : #render }
PDFElement >> initialize [ 
	super initialize.

	self styleSheet: PDFStyleSheet new.
	
]

{ #category : #'as yet unclassified' }
PDFElement >> minimumDimensionWith: aPDFGenerator styleSheet: aStyleSheet [
	"Return the minimum wh for layout, by default its the one defined by the user"
	^ self wh
]

{ #category : #accessing }
PDFElement >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFElement >> styleSheet: anObject [
	styleSheet := anObject
]

{ #category : #accessing }
PDFElement >> wh [
	^ wh
]

{ #category : #accessing }
PDFElement >> wh: anObject [
	wh := anObject
]
