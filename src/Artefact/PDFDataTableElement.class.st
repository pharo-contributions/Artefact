Class {
	#name : #PDFDataTableElement,
	#superclass : #PDFComposite,
	#instVars : [
		'data',
		'margin'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #'as yet unclassified' }
PDFDataTableElement >> cellDimensions [
	^ (self wh x / self cellsData first size) @ (self wh y / self cellsData size)
]

{ #category : #'as yet unclassified' }
PDFDataTableElement >> cellsData [
	^ self data
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

{ #category : #'as yet unclassified' }
PDFDataTableElement >> getSubElementsWith: aGenerator styleSheet: aStyleSheet [
	| currentFrom aCellDimension |
	currentFrom := self from.
	aCellDimension := self cellDimensions.
	^ self cellsData
		inject: OrderedCollection new
		into: [ :collection :anArray | 
			| result |
			result := collection , (anArray
				collect: [ :aData | 
					| cell |
					cell := PDFCellElement new
						text: aData asString;
						wh: aCellDimension;
						from: currentFrom;
						yourself.
					currentFrom := currentFrom + (aCellDimension x @ 0pt).
					cell ]).
			currentFrom := self from x @ (currentFrom y + aCellDimension y).

			result ]
]

{ #category : #accessing }
PDFDataTableElement >> margin [
	^margin ifNil: [ margin := 1 point ]
]

{ #category : #accessing }
PDFDataTableElement >> margin: aMargin [
	margin := aMargin
]
