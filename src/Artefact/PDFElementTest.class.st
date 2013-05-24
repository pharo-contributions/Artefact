Class {
	#name : #PDFElementTest,
	#superclass : #TestCase,
	#category : #'Artefact-Elements-Test'
}

{ #category : #orientation }
PDFElementTest >> testOrientationBottomLeft [
	self assert: (PDFElement determineOrientation: -20 mm @ 10mm) equals: #bottomLeft
]

{ #category : #orientation }
PDFElementTest >> testOrientationBottomRight [
	self assert: (PDFElement determineOrientation: 20 mm @ 10mm) equals: #bottomRight
]

{ #category : #orientation }
PDFElementTest >> testOrientationDefaultCase [
	self assert: (PDFElement determineOrientation: 0 mm @ 0 mm) equals: #bottomRight
]

{ #category : #orientation }
PDFElementTest >> testOrientationTopLeft [
	self assert: (PDFElement determineOrientation: -20 mm @ -10mm) equals: #topLeft
]

{ #category : #orientation }
PDFElementTest >> testOrientationTopRight [
	self assert: (PDFElement determineOrientation: 20 mm @ -10mm) equals: #topRight
]
