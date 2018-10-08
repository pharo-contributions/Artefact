"
A PDFAlignment represents an alignment (horizontal and vertical).

Instance Variables
	horizontal:		<Object>
	vertical:		<Object>

horizontal
	- xxxxx

vertical
	- xxxxx

"
Class {
	#name : #PDFAlignment,
	#superclass : #Object,
	#instVars : [
		'horizontal',
		'vertical'
	],
	#category : #'Artefact-Core-Base'
}

{ #category : #position }
PDFAlignment class >> bottom [
	^ self new bottom
]

{ #category : #position }
PDFAlignment class >> center [
	^ self new center
]

{ #category : #position }
PDFAlignment class >> left [
	^ self new left
]

{ #category : #position }
PDFAlignment class >> middle [
	^ self new middle
]

{ #category : #position }
PDFAlignment class >> right [
	^ self new right
]

{ #category : #position }
PDFAlignment class >> top [
	^ self new top
]

{ #category : #position }
PDFAlignment >> bottom [
	self vertical: #BOTTOM
]

{ #category : #position }
PDFAlignment >> center [
	self horizontal: #CENTER
]

{ #category : #accessing }
PDFAlignment >> horizontal [
	^ horizontal
]

{ #category : #accessing }
PDFAlignment >> horizontal: anObject [
	horizontal := anObject
]

{ #category : #'initialize-release' }
PDFAlignment >> initialize [
	self left;
	 middle.
]

{ #category : #checking }
PDFAlignment >> isBottom [
	^ self vertical = #BOTTOM
]

{ #category : #checking }
PDFAlignment >> isCenter [
	^ self horizontal = #CENTER
]

{ #category : #checking }
PDFAlignment >> isLeft [
	^ self horizontal = #LEFT
]

{ #category : #checking }
PDFAlignment >> isMiddle [
	^ self vertical = #MIDDLE
]

{ #category : #checking }
PDFAlignment >> isRight [
	^ self horizontal = #RIGHT
]

{ #category : #checking }
PDFAlignment >> isTop [
	^ self vertical = #TOP
]

{ #category : #position }
PDFAlignment >> left [
	self horizontal:  #LEFT
]

{ #category : #position }
PDFAlignment >> middle [
	self vertical: #MIDDLE
]

{ #category : #position }
PDFAlignment >> right [
	self horizontal: #RIGHT
]

{ #category : #position }
PDFAlignment >> top [
	self vertical: #TOP
]

{ #category : #accessing }
PDFAlignment >> vertical [
	^ vertical
]

{ #category : #accessing }
PDFAlignment >> vertical: anObject [
	vertical := anObject
]
