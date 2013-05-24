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
		'data'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #render }
PDFDataTableElement >> cellDimensions [
	^ (self dimension x / self cellsData first size) @ (self dimension y / self cellsData size)
]

{ #category : #render }
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

{ #category : #render }
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
					cell := PDFCellElement from: currentFrom dimension: aCellDimension text: aData asString.	
					currentFrom := currentFrom + (aCellDimension x @ 0pt).
					cell ]).
			currentFrom := self from x @ (currentFrom y + aCellDimension y).

			result ]
]

{ #category : #accessing }
PDFDataTableElement >> margin: aMargin [
	self styleSheet margin: aMargin
]

{ #category : #checking }
PDFDataTableElement >> requiredAttributes [
	^ #( from data dimension )
]
