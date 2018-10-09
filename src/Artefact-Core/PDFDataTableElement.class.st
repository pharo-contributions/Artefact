"
A PDFDataTableElement is a basic table. You just have to fill it with a two dimensions array and the composite will create every cells.

Instance Variables
	data:		<Object>
	margin:		<Object>

data
	- xxxxx

margin
	- xxxxx

"
Class {
	#name : #PDFDataTableElement,
	#superclass : #PDFComposite,
	#instVars : [
		'data',
		'customizationBlock'
	],
	#category : #'Artefact-Core-Elements-Composites'
}

{ #category : #render }
PDFDataTableElement >> calculateMinimumDimensionsForCells: cells withGenerator: aGenerator styleSheet: aStyleSheet [
	| individualMinimumDimensions contextualMinimumDimensions |
	individualMinimumDimensions := cells collect: [ :anArray | 
			(anArray
				collect: [ :aCell | 
					aCell minimumDimensionWith: aGenerator styleSheet: aStyleSheet
					]).
			].
		
	contextualMinimumDimensions := individualMinimumDimensions collect: [ :lines |
		|x y|
		y := lines max: #y.
		lines collectWithIndex: [ :dim :i  | x := individualMinimumDimensions max: [:line | (line at: i) x]. x@y]
	 ].
	^ contextualMinimumDimensions	
]

{ #category : #render }
PDFDataTableElement >> cellDimensions [
	^ (self dimension x / self cellsData first size) @ (self dimension y / self cellsData size)
]

{ #category : #render }
PDFDataTableElement >> cellsData [
	^ self data
]

{ #category : #accessing }
PDFDataTableElement >> customizationBlock [
	^ customizationBlock
]

{ #category : #accessing }
PDFDataTableElement >> customizationBlock: anObject [
	customizationBlock := anObject
]

{ #category : #accessing }
PDFDataTableElement >> data [
	^data
]

{ #category : #accessing }
PDFDataTableElement >> data: aTwoDimensionArray [
	data := aTwoDimensionArray
]

{ #category : #'initialize-release' }
PDFDataTableElement >> defaultStyle [
	^ #datatable
]

{ #category : #render }
PDFDataTableElement >> getCellsWith: aGenerator styleSheet: aStyleSheet [
	| x y |
	y := 0.
	^ self cellsData
		collect: [ :anArray | 
			x := 1.
			y := y + 1.
			anArray
				collect: [ :aData | 
					| cell |
					cell := PDFCellElement text: aData asString.
					self customizationBlock
						value: cell
						value: x
						value: y
						value: aData.
					x := x + 1.
					cell ] ]
]

{ #category : #render }
PDFDataTableElement >> getOldSubElementsWith: aGenerator styleSheet: aStyleSheet [
	| currentFrom aCellDimension x y |
	y := 1.
	currentFrom := self from.
	aCellDimension := self cellDimensions.
	^ self cellsData
		inject: OrderedCollection new
		into: [ :collection :anArray | 
			| result |
			x := 1.
			result := collection , (anArray
				collect: [ :aData | 
					| cell |
					cell := PDFCellElement from: currentFrom dimension: aCellDimension text: aData asString.
					self customizationBlock value: cell value: x value: y value: aData.
					currentFrom := currentFrom + (aCellDimension x @ 0pt).
					x := x + 1.
					cell ]).
			currentFrom := self from x @ (currentFrom y + aCellDimension y).
			y := y + 1.
			result ]
]

{ #category : #render }
PDFDataTableElement >> getProtoSubElementsWith: aGenerator styleSheet: aStyleSheet [
	| currentFrom aCellDimension  cells minimumDimensions |
	currentFrom := self from.
	aCellDimension := self cellDimensions.
	cells:= self getCellsWith: aGenerator styleSheet: aStyleSheet.
	minimumDimensions := self calculateMinimumDimensionsForCells: cells withGenerator: aGenerator styleSheet: aStyleSheet.
	cells do: [ :anArray | 
			(anArray
				do: [ :aCell | 
					aCell from: currentFrom; dimension: aCellDimension.
					currentFrom := currentFrom + (aCellDimension x @ 0pt).
					]).
			currentFrom := self from x @ (currentFrom y + aCellDimension y).
			].
		
	^ cells flatten
]

{ #category : #render }
PDFDataTableElement >> getSubElementsWith: aGenerator styleSheet: aStyleSheet [
	| currentFrom cells minimumDimensions cellsDimensions |
	currentFrom := self from.
	cells:= self getCellsWith: aGenerator styleSheet: aStyleSheet.
	minimumDimensions := self calculateMinimumDimensionsForCells: cells withGenerator: aGenerator styleSheet: aStyleSheet.
	cellsDimensions := self scaleMinimumCellsDimensions: minimumDimensions.
	cells doWithIndex: [ :anArray :line | 
			(anArray
				doWithIndex: [ :aCell :column | 
					aCell from: currentFrom; dimension: ((cellsDimensions at:line) at: column).
					currentFrom := currentFrom + (aCell dimension x @ 0pt).
					]).
			currentFrom := self from x @ (currentFrom y + (cellsDimensions at:line) first y).
			].
		
	^ cells flattened
]

{ #category : #'initialize-release' }
PDFDataTableElement >> initialize [ 
	super initialize.
	self customizationBlock: [ :cell :x :y :cellData | ].
]

{ #category : #accessing }
PDFDataTableElement >> margin: aMargin [
	self styleSheet margin: aMargin
]

{ #category : #checking }
PDFDataTableElement >> requiredAttributes [
	^ #( from data dimension )
]

{ #category : #render }
PDFDataTableElement >> scaleMinimumCellsDimensions: minimumDimensions [
	| totalMinimumDimension scale |
	totalMinimumDimension := (minimumDimensions first sum: #x) @ (minimumDimensions sum: [ :line | line first y ]).
	self dimension ifNotNil: [ ((totalMinimumDimension x > self dimension x) or: [totalMinimumDimension y > self dimension y]) ifTrue: [self error: 'dimension too small for datas (required: ', (totalMinimumDimension x convertTo: self dimension x unit) asString, '@', (totalMinimumDimension y convertTo: self dimension y unit) asString, ' provided: ', self dimension asString ]].
	
	scale := self dimension / totalMinimumDimension.
	^ minimumDimensions collect: [ :line | line collect: [ :dim | dim * scale ] ]
]
