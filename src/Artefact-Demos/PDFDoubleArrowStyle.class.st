Class {
	#name : #PDFDoubleArrowStyle,
	#superclass : #PDFArrow,
	#instVars : [
		'arrowElement',
		'originHeadFirstElement',
		'originHeadSecondElement'
	],
	#category : #'Artefact-Styles'
}

{ #category : #action }
PDFDoubleArrowStyle >> angle [
	"In this method, origin and destination are inversed"
	^(xy y - destination y) arcTan: (xy x - destination x)
]

{ #category : #accessing }
PDFDoubleArrowStyle >> dotted: aPDFDottedObject [
	arrowElement dotted: aPDFDottedObject.
	originHeadFirstElement dotted: aPDFDottedObject.
	originHeadSecondElement dotted: aPDFDottedObject
]

{ #category : #accessing }
PDFDoubleArrowStyle >> drawColor: aPDFColor [
	arrowElement drawColor: aPDFColor.
	originHeadFirstElement drawColor: aPDFColor.
	originHeadSecondElement drawColor: aPDFColor.
]

{ #category : #render }
PDFDoubleArrowStyle >> getStyles [ 
	"answer the style description"
	
	^ OrderedCollection new
		add: (arrowElement xy: self xy; destination: self destination);
		add: (originHeadFirstElement xy: self xy; destination: (self destinationOfHeadItem: (self angle - ((Float pi) / 6)) with: self xy));
		add: (originHeadSecondElement xy: self xy; destination: (self destinationOfHeadItem: (self angle + ((Float pi) / 6)) with: self xy));
		yourself.
]

{ #category : #'initialize-release' }
PDFDoubleArrowStyle >> initialize [
	super initialize.
	arrowElement := PDFArrowStyle new.
	originHeadFirstElement := PDFLineStyle new.
	originHeadSecondElement := PDFLineStyle new.
]

{ #category : #accessing }
PDFDoubleArrowStyle >> thickness: aThickness [
	arrowElement thickness: aThickness.
	originHeadFirstElement thickness: aThickness.
	originHeadSecondElement thickness: aThickness.
]
