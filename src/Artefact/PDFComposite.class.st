Class {
	#name : #PDFComposite,
	#superclass : #PDFVisibleItem,
	#category : #'Artefact-Elements'
}

{ #category : #accessing }
PDFComposite >> dotted: aPDFDottedObject [
	self styleSheet dotted: aPDFDottedObject
]

{ #category : #accessing }
PDFComposite >> drawColor: aColor [
	self styleSheet drawColor: aColor
]

{ #category : #accessing }
PDFComposite >> fillColor: aColor [
	self styleSheet fillColor: aColor
]

{ #category : #accessing }
PDFComposite >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #render }
PDFComposite >> generateCodeSegmentWith: aPDFGenerator styleSheet: aStyleSheet [
	| compositeStyleSheet |
	compositeStyleSheet := aStyleSheet + self styleSheet.
	^ PDFCompositeCodeSegment
		from:
			((self getSubElementsWith: aPDFGenerator styleSheet: compositeStyleSheet)
				collect: [ :aSubElement | aSubElement generateCodeSegmentWith: aPDFGenerator styleSheet: compositeStyleSheet ])
		styleSheet: compositeStyleSheet
]

{ #category : #render }
PDFComposite >> getSubElementsWith: aPDFGenerator styleSheet: anObject [
	""
	self subclassResponsibility
]

{ #category : #accessing }
PDFComposite >> textColor: aColor [
	self styleSheet textColor: aColor
]

{ #category : #accessing }
PDFComposite >> thickness: aThickness [
	self styleSheet thickness: aThickness 
 
]
