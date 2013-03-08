Class {
	#name : #PDFFontTest,
	#superclass : #TestCase,
	#instVars : [
		'doc',
		'page'
	],
	#category : #'Artefact-Test'
}

{ #category : #accessing }
PDFFontTest >> doc [
	^ doc
]

{ #category : #accessing }
PDFFontTest >> doc: anObject [
	doc := anObject
]

{ #category : #accessing }
PDFFontTest >> page [
	^ page
]

{ #category : #accessing }
PDFFontTest >> page: anObject [
	page := anObject
]

{ #category : #'as yet unclassified' }
PDFFontTest >> setUp [
	self doc: PDFDocument new.
]

{ #category : #'as yet unclassified' }
PDFFontTest >> tearDown [ 
]

{ #category : #fontsWidth }
PDFFontTest >> testCourierBIWidth [
	self assert: (PDFCourierFont new fontSize: 16; bold: true; italic: true; getStringWidth: 'hello') = 16.933.
]

{ #category : #fontsWidth }
PDFFontTest >> testCourierBWidth [
	self assert: (PDFCourierFont new fontSize: 16; bold: true; getStringWidth: 'hello') = 16.933.
]

{ #category : #fontsWidth }
PDFFontTest >> testCourierIWidth [
	self assert: (PDFCourierFont new fontSize: 16;  italic: true; getStringWidth: 'hello') = 16.933.
]

{ #category : #fontsWidth }
PDFFontTest >> testCourierWidth [
	self assert: (PDFCourierFont new fontSize: 16; getStringWidth: 'hello') = 16.933.
]

{ #category : #fontsWidth }
PDFFontTest >> testHelveticaBIWidth [
	self assert: ((PDFHelveticaFont new fontSize: 16; bold: true; italic: true; getStringWidth: 'hello') closeTo: 13.174)
]

{ #category : #fontsWidth }
PDFFontTest >> testHelveticaBWidth [
	self assert: (PDFHelveticaFont new fontSize: 16; bold: true; getStringWidth: 'hello') = 13.174.	
]

{ #category : #fontsWidth }
PDFFontTest >> testHelveticaIWidth [
	self assert: (PDFHelveticaFont new fontSize: 16;  italic: true; getStringWidth: 'hello') = 11.921.
]

{ #category : #fontsWidth }
PDFFontTest >> testHelveticaWidth [
	self assert: (PDFHelveticaFont new fontSize: 16; getStringWidth: 'hello') = 11.921.	
]

{ #category : #fontsWidth }
PDFFontTest >> testSymbolWidth [
	self assert: (PDFSymbolFont new fontSize: 16; getStringWidth: 'hello') = 15.177.
]

{ #category : #fontsWidth }
PDFFontTest >> testTimesBIWidth [
	self assert: (PDFTimesFont new fontSize: 16; bold:true; italic:true; getStringWidth: 'hello') = 11.604
]

{ #category : #fontsWidth }
PDFFontTest >> testTimesBWidth [
	self assert: (PDFTimesFont new fontSize: 16;bold:true; getStringWidth: 'hello') = 11.604
]

{ #category : #fontsWidth }
PDFFontTest >> testTimesIWidth [
	self assert: (PDFTimesFont new fontSize: 16; italic:true; getStringWidth: 'hello') = 11.288
]

{ #category : #fontsWidth }
PDFFontTest >> testTimesWidth [
	self assert: (PDFTimesFont new fontSize: 16; getStringWidth: 'hello') = 11.288.
]

{ #category : #fontsWidth }
PDFFontTest >> testZapfdingbatsWidth [
	self assert: (PDFZapfdingbatsFont new fontSize: 16; getStringWidth: 'hello') = 21.601.
]
