"
PDFFormat has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.

Instance Variables:
	portrait	<ProtoObject>
	margins	<Point | TTPoint>
	size	<Point | TTPoint>
		
	28,347619048
	
"
Class {
	#name : #PDFFormat,
	#superclass : #Object,
	#instVars : [
		'portrait',
		'margins',
		'size'
	],
	#category : #'Artefact-Core-Formats'
}

{ #category : #'accessing - defaults' }
PDFFormat >> defaultMargins [

	^28.35 point @ 28.35 point
]

{ #category : #'accessing - defaults' }
PDFFormat >> defaultSize [

	^ self subclassResponsibility 
]

{ #category : #'accessing - dimensions' }
PDFFormat >> height [
	"Answer the height of a page"
	^self size y
]

{ #category : #initialization }
PDFFormat >> initialize [
	super initialize.
	self margins: self defaultMargins.
	self size: self defaultSize.
	self setPortrait
]

{ #category : #'accessing - margins' }
PDFFormat >> leftMargin [
	^(self margins x)
]

{ #category : #'accessing - margins' }
PDFFormat >> margins [
	^ margins
]

{ #category : #'accessing - margins' }
PDFFormat >> margins: anObject [
	margins := anObject
]

{ #category : #accessing }
PDFFormat >> portrait [
	^ portrait
]

{ #category : #accessing }
PDFFormat >> portrait: anObject [
	portrait := anObject
]

{ #category : #'page setup' }
PDFFormat >> setLandscape [
	"Set the page in landscape orientation"
	self portrait: false.
	self size: (self size y) @ (self size x).	
]

{ #category : #'page setup' }
PDFFormat >> setPortrait [
	"Set the page in portrait orientation"
	self portrait: true.
	self size: (self size x) @ (self size y). 

]

{ #category : #'accessing - dimensions' }
PDFFormat >> size [
	^ size
]

{ #category : #'accessing - dimensions' }
PDFFormat >> size: anObject [
	size := anObject
]

{ #category : #'accessing - margins' }
PDFFormat >> topMargin [
	^(self margins y)
]

{ #category : #'accessing - dimensions' }
PDFFormat >> width [
	"Answer the width of the page"
	^self size x
]
