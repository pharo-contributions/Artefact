"
A BarCodeElement is a component representing a barcode. It can use multiple encoders.

Instance Variables
	encoder:		<Object>
	value:		<Object>

encoder
	- xxxxx

value
	- xxxxx

"
Class {
	#name : #BarCodeElement,
	#superclass : #PDFComposite,
	#instVars : [
		'value',
		'encoder'
	],
	#category : #ArteBar
}

{ #category : #style }
BarCodeElement >> defaultStyle [
	^ #barcode
]

{ #category : #encoder }
BarCodeElement >> ean13 [
	self encoder: BarcodeEAN13
]

{ #category : #encoder }
BarCodeElement >> ean8 [
	self encoder: BarcodeEAN8
]

{ #category : #accessing }
BarCodeElement >> encoder [
	^ encoder
]

{ #category : #accessing }
BarCodeElement >> encoder: anObject [
	encoder := anObject
]

{ #category : #render }
BarCodeElement >> getSubElementsWith: aPDFGenerator styleSheet: aStyleSheet [
	""

	| barcode sequence step result |
	barcode := self encoder data: self value.
	sequence := barcode binarySequence.
	step := self width / sequence size.
	result := OrderedCollection new.
	sequence
		withIndexDo: [ :each :index | 
			each = $1
				ifTrue: [ 
					result
						add:
							((PDFLineElement from: self from + ((index * step) @ 0 pt) to: (self from x + (index * step)) @ self to y)
								thickness: step) ] ].	"Line thickness is defined here to be prioritary among any stylesheet"
	^ result
]

{ #category : #accessing }
BarCodeElement >> value [
	^ value
]

{ #category : #accessing }
BarCodeElement >> value: anObject [
	value := anObject
]
