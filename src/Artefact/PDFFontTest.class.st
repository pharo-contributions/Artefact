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
	self
		assert:
			(PDFCourierFont new
				fontSize: 16 pt;
				bold: true;
				italic: true;
				getStringWidth: 'hello')
		equals: 48 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testCourierBWidth [
	self
		assert:
			(PDFCourierFont new
				fontSize: 16 pt;
				bold: true;
				getStringWidth: 'hello')
		equals: 48 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testCourierIWidth [
	self
		assert:
			(PDFCourierFont new
				fontSize: 16 pt;
				italic: true;
				getStringWidth: 'hello')
		equals: 48 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testCourierWidth [
	self
		assert:
			(PDFCourierFont new
				fontSize: 16 pt;
				getStringWidth: 'hello')
		equals: 48 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testHelveticaBIWidth [
	self
		assert:
			(PDFHelveticaFont new
				fontSize: 16 pt;
				bold: true;
				italic: true;
				getStringWidth: 'hello') rounded
		equals: 47 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testHelveticaBWidth [
	self
		assert:
			(PDFHelveticaFont new
				fontSize: 16 pt;
				bold: true;
				getStringWidth: 'hello') rounded
		equals: 47 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testHelveticaIWidth [
	self
		assert:
			(PDFHelveticaFont new
				fontSize: 16 pt;
				italic: true;
				getStringWidth: 'hello') rounded
		equals: 43 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testHelveticaWidth [
	self
		assert:
			(PDFHelveticaFont new
				fontSize: 16 pt;
				getStringWidth: 'hello') rounded
		equals: 43 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testSymbolWidth [
	self
		assert:
			(PDFSymbolFont new
				fontSize: 16 pt;
				getStringWidth: 'hello') rounded
		equals: 40 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testTimesBIWidth [
	self
		assert:
			(PDFTimesFont new
				fontSize: 16 pt;
				bold: true;
				italic: true;
				getStringWidth: 'hello') rounded
		equals: 41 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testTimesBWidth [
	self
		assert:
			(PDFTimesFont new
				fontSize: 16 pt;
				bold: true;
				getStringWidth: 'hello') rounded
		equals: 44 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testTimesIWidth [
	self
		assert:
			(PDFTimesFont new
				fontSize: 16 pt;
				italic: true;
				getStringWidth: 'hello') rounded
		equals: 38 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testTimesWidth [
	self
		assert:
			(PDFTimesFont new
				fontSize: 16 pt;
				getStringWidth: 'hello') rounded
		equals: 40 pt
]

{ #category : #fontsWidth }
PDFFontTest >> testZapfdingbatsWidth [
	self
		assert:
			(PDFZapfdingbatsFont new
				fontSize: 16 pt;
				getStringWidth: 'hello') rounded
		equals: 61 pt
]
