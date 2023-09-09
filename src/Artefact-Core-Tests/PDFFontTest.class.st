Class {
	#name : #PDFFontTest,
	#superclass : #TestCase,
	#instVars : [
		'doc',
		'page'
	],
	#category : #'Artefact-Core-Tests-Base'
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

{ #category : #running }
PDFFontTest >> setUp [
	self doc: PDFDocument new
]

{ #category : #running }
PDFFontTest >> tearDown [
]

{ #category : #'tests - fonts width' }
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

{ #category : #'tests - fonts width' }
PDFFontTest >> testCourierBWidth [
	self
		assert:
			(PDFCourierFont new
				fontSize: 16 pt;
				bold: true;
				getStringWidth: 'hello')
		equals: 48 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testCourierIWidth [
	self
		assert:
			(PDFCourierFont new
				fontSize: 16 pt;
				italic: true;
				getStringWidth: 'hello')
		equals: 48 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testCourierWidth [
	self
		assert:
			(PDFCourierFont new
				fontSize: 16 pt;
				getStringWidth: 'hello')
		equals: 48 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testHelveticaBIWidth [
	self
		assert:
			(PDFHelveticaFont new
				fontSize: 16 pt;
				bold: true;
				italic: true;
				getStringWidth: 'hello') rounded
		equals: 37 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testHelveticaBWidth [
	self
		assert:
			(PDFHelveticaFont new
				fontSize: 16 pt;
				bold: true;
				getStringWidth: 'hello') rounded
		equals: 37 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testHelveticaIWidth [
	self
		assert:
			(PDFHelveticaFont new
				fontSize: 16 pt;
				italic: true;
				getStringWidth: 'hello') rounded
		equals: 34 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testHelveticaWidth [
	self
		assert:
			(PDFHelveticaFont new
				fontSize: 16 pt;
				getStringWidth: 'hello') rounded
		equals: 34 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testSymbolWidth [
	self
		assert:
			(PDFSymbolFont new
				fontSize: 16 pt;
				getStringWidth: 'hello') rounded
		equals: 43 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testTimesBIWidth [
	self
		assert:
			(PDFTimesFont new
				fontSize: 16 pt;
				bold: true;
				italic: true;
				getStringWidth: 'hello') rounded
		equals: 33 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testTimesBWidth [
	self
		assert:
			(PDFTimesFont new
				fontSize: 16 pt;
				bold: true;
				getStringWidth: 'hello') rounded
		equals: 33 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testTimesIWidth [
	self
		assert:
			(PDFTimesFont new
				fontSize: 16 pt;
				italic: true;
				getStringWidth: 'hello') rounded
		equals: 32 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testTimesWidth [
	self
		assert:
			(PDFTimesFont new
				fontSize: 16 pt;
				getStringWidth: 'hello') rounded
		equals: 32 pt
]

{ #category : #'tests - fonts width' }
PDFFontTest >> testZapfdingbatsWidth [
	self
		assert:
			(PDFZapfdingbatsFont new
				fontSize: 16 pt;
				getStringWidth: 'hello') rounded
		equals: 61 pt
]
