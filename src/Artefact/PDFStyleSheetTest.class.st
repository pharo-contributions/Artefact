Class {
	#name : #PDFStyleSheetTest,
	#superclass : #TestCase,
	#category : #'Artefact-Test'
}

{ #category : #tests }
PDFStyleSheetTest >> testAdditionDoNotModifyFirstStyleSheet [
	| first second result |
	first := PDFStyleSheet new.
	first textColor: (PDFColor r: 0 g: 128 b: 255).
	second := PDFStyleSheet new.
	second textColor: (PDFColor r: 0 g: 12 b: 24).
	result := first + second.
	self assert: (first get: #textColor) equals: (PDFColor r: 0 g: 128 b: 255).
	self assert: (second get: #textColor) equals: (PDFColor r: 0 g: 12 b: 24).
	self assert: (result get: #textColor) equals: (PDFColor r: 0 g: 12 b: 24)
]

{ #category : #tests }
PDFStyleSheetTest >> testSubstyleAttributes [
	| base |
	base := PDFStyleSheet new.
	base at: #textColor put: (PDFColor r: 255 g: 0 b: 0).
	base > #sub at: #textColor put: (PDFColor r: 0 g: 255 b: 0).
	base > #sub > #subsub at: #textColor put: (PDFColor r: 0 g: 0 b: 255).
	self assert:( base get: #textColor ) equals: (PDFColor r: 255 g: 0 b: 0).
	self assert:( base > #sub get: #textColor ) equals: (PDFColor r: 0 g: 255 b: 0).
	self assert:( base > #sub > #subsub get: #textColor ) equals: (PDFColor r: 0 g: 0 b: 255).
]

{ #category : #tests }
PDFStyleSheetTest >> testSubstyleCreation [
	| base sub |
	base := PDFStyleSheet new.
	sub := base > #sub.
	self assert: sub equals: base > #sub
]
