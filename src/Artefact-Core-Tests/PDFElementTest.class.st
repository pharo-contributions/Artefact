Class {
	#name : #PDFElementTest,
	#superclass : #TestCase,
	#category : #'Artefact-Core-Tests-Elements'
}

{ #category : #'tests - orientation' }
PDFElementTest >> testOrientationBottomLeft [
	self assert: (PDFElement determineOrientation: -20 mm @ 10mm) equals: #bottomLeft
]

{ #category : #'tests - orientation' }
PDFElementTest >> testOrientationBottomRight [
	self assert: (PDFElement determineOrientation: 20 mm @ 10mm) equals: #bottomRight
]

{ #category : #'tests - orientation' }
PDFElementTest >> testOrientationDefaultCase [
	self assert: (PDFElement determineOrientation: 0 mm @ 0 mm) equals: #bottomRight
]

{ #category : #'tests - orientation' }
PDFElementTest >> testOrientationTopLeft [
	self assert: (PDFElement determineOrientation: -20 mm @ -10mm) equals: #topLeft
]

{ #category : #'tests - orientation' }
PDFElementTest >> testOrientationTopRight [
	self assert: (PDFElement determineOrientation: 20 mm @ -10mm) equals: #topRight
]

{ #category : #tests }
PDFElementTest >> testRequiredAttributesIsFilled [
	self shouldnt: [(PDFDummyLayout new from: 10mm@5mm; dimension: 5cm@12cm) checkAttributes] raise: ArtefactUndefinedAttribute
]

{ #category : #tests }
PDFElementTest >> testRequiredAttributesIsNotFilled [
	self should: [PDFDummyLayout new checkAttributes] raise: ArtefactUndefinedAttribute
]
