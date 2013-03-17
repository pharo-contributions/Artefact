"
A PDFLayout is the abstract class which any layout inherit. It contains a list of elements to place. A layout that inherit from PDFLayout just have to implement computeNextPositionElement

Instance Variables
	elements:		<Object>
	nextElementFrom:		<Object>

elements
	- xxxxx

nextElementFrom
	- xxxxx

"
Class {
	#name : #PDFLayout,
	#superclass : #PDFComposite,
	#instVars : [
		'elements',
		'nextElementFrom'
	],
	#category : #'Artefact-Elements'
}

{ #category : #adding }
PDFLayout >> add: aPDFElement [
	self elements addLast: aPDFElement
]

{ #category : #render }
PDFLayout >> computeNextElementPositionWith: aPDFGenerator styleSheet: aStyleSheet elementPosition: aPosition dimension: aDimension [
	^ self subclassResponsibility
]

{ #category : #accessing }
PDFLayout >> elements [
	^ elements
]

{ #category : #accessing }
PDFLayout >> elements: anObject [
	elements := anObject
]

{ #category : #render }
PDFLayout >> generateCodeSegmentsCollectionWith: aPDFGenerator styleSheet: compositeStyleSheet [
	| oldFrom codeSegment elementPosition |
	elementPosition := self from.
	^ self elements
		collect: [ :anElement | 
			oldFrom := anElement from.
			anElement from: elementPosition.
			codeSegment := anElement generateCodeSegmentWith: aPDFGenerator styleSheet: compositeStyleSheet.
			elementPosition := self
				computeNextElementPositionWith: aPDFGenerator
				styleSheet: compositeStyleSheet
				elementPosition: elementPosition
				dimension: (anElement minimumDimensionWith: aPDFGenerator styleSheet: compositeStyleSheet).
			anElement from: oldFrom.
			codeSegment ]
]

{ #category : #accessing }
PDFLayout >> initialize [ 
	super initialize.
	elements:= OrderedCollection new.
]

{ #category : #accessing }
PDFLayout >> nextElementFrom [
	^ nextElementFrom ifNil: [ self from ]
]

{ #category : #accessing }
PDFLayout >> nextElementFrom: nextPosition [
	nextElementFrom:= nextPosition
]
