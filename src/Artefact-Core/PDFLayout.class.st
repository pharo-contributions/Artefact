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
	#category : #'Artefact-Core-Elements'
}

{ #category : #'instance creation' }
PDFLayout class >> on: aCollection [
	^ self new elements: aCollection
]

{ #category : #adding }
PDFLayout >> add: aPDFElement [
	self elements addLast: aPDFElement
]

{ #category : #render }
PDFLayout >> createOriginalDimensionDictionary [
	| dimensions |
	dimensions := Dictionary new. 
	self elements do: [ :anElement | dimensions at: anElement put: anElement dimension ].
	^ dimensions
]

{ #category : #render }
PDFLayout >> createOriginalPositionDictionary [
	| positions |
	positions := Dictionary new. 
	self elements do: [ :anElement | positions at: anElement put: anElement from ].
	^ positions
]

{ #category : #style }
PDFLayout >> defaultStyle [
	^ #default
]

{ #category : #render }
PDFLayout >> defineElementDimension: anElement with: aPDFGenerator styleSheet: aStyleSheet [
	anElement dimension: (anElement minimumDimensionWith: aPDFGenerator styleSheet: aStyleSheet)
]

{ #category : #render }
PDFLayout >> defineElementPosition: anElement with: aPDFGenerator styleSheet: aStyleSheet [
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
PDFLayout >> generateCodeSegmentsCollectionWith: aPDFGenerator styleSheet: aStyleSheet  format: aFormat [
	| elementsOriginalPosition codeSegments compositeStyleSheet elementsOriginalDimension |
	elementsOriginalPosition := self createOriginalPositionDictionary.
	elementsOriginalDimension := self createOriginalDimensionDictionary.
	codeSegments := self elements
		collect: [ :anElement | 
			compositeStyleSheet := anElement buildCompositeStyleSheetFrom: aStyleSheet.
			self defineElementPosition: anElement with: aPDFGenerator styleSheet: compositeStyleSheet.
			self defineElementDimension: anElement with: aPDFGenerator styleSheet: compositeStyleSheet.
			anElement generateCodeSegmentWith: aPDFGenerator styleSheet: compositeStyleSheet format: aFormat ].
	elementsOriginalPosition keysAndValuesDo: [ :anElement :aPosition | anElement from: aPosition ].
	elementsOriginalDimension keysAndValuesDo: [ :anElement :aDimension | anElement dimension: aDimension ].
	^ codeSegments
]

{ #category : #render }
PDFLayout >> generateCodeSegmentsCollectionWith: aPDFGenerator styleSheet: aStyleSheet  page: aPage [
	| elementsOriginalPosition codeSegments compositeStyleSheet elementsOriginalDimension |
	elementsOriginalPosition := self createOriginalPositionDictionary.
	elementsOriginalDimension := self createOriginalDimensionDictionary.
	codeSegments := self elements
		collect: [ :anElement | 
			compositeStyleSheet := anElement buildCompositeStyleSheetFrom: aStyleSheet.
			self defineElementPosition: anElement with: aPDFGenerator styleSheet: compositeStyleSheet.
			self defineElementDimension: anElement with: aPDFGenerator styleSheet: compositeStyleSheet.
			anElement generateCodeSegmentWith: aPDFGenerator styleSheet: compositeStyleSheet page: aPage ].
	elementsOriginalPosition keysAndValuesDo: [ :anElement :aPosition | anElement from: aPosition ].
	elementsOriginalDimension keysAndValuesDo: [ :anElement :aDimension | anElement dimension: aDimension ].
	^ codeSegments
]

{ #category : #'initialize-release' }
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
