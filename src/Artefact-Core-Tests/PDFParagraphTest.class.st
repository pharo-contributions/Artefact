Class {
	#name : #PDFParagraphTest,
	#superclass : #TestCase,
	#instVars : [
		'doc',
		'page',
		'paragraph'
	],
	#category : #'Artefact-Core-Tests-Base'
}

{ #category : #accessing }
PDFParagraphTest >> doc [

	^ doc
]

{ #category : #accessing }
PDFParagraphTest >> doc: anObject [

	doc := anObject
]

{ #category : #accessing }
PDFParagraphTest >> page [

	^ page
]

{ #category : #accessing }
PDFParagraphTest >> page: anObject [

	page := anObject
]

{ #category : #accessing }
PDFParagraphTest >> paragraph [

	^ paragraph
]

{ #category : #accessing }
PDFParagraphTest >> paragraph: anObject [

	paragraph := anObject
]

{ #category : #running }
PDFParagraphTest >> setUp [

	super setUp.
	self doc: PDFDocument new.
	self page: PDFPage new.

	self paragraph: (PDFParagraphElement new
		from: 10mm@10mm;
		dimension: 160mm@60mm;
		text: 'Emensis itaque difficultatibus multis et nive obrutis callibus plurimis ubi prope Rauracum ventum est ad supercilia fluminis Rheni, resistente multitudine Alamanna pontem suspendere navium conpage Romani vi nimia vetabantur ritu grandinis undique convolantibus telis, et cum id inpossibile videretur, imperator cogitationibus magnis attonitus, quid capesseret ambigebat.').

	self page add: self paragraph.
	self doc add: self page.

	self doc generate
]

{ #category : #tests }
PDFParagraphTest >> testDimensions [

	self assert: paragraph dimension equals: 160mm@60mm
]

{ #category : #tests }
PDFParagraphTest >> testOrigin [

	self assert: paragraph from equals: 10 mm @ 10 mm
]
