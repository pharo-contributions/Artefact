Class {
	#name : #PDFParagraphTest,
	#superclass : #TestCase,
	#instVars : [
		'doc',
		'page',
		'paragraph'
	],
	#category : #'Artefact-Test'
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

{ #category : #'as yet unclassified' }
PDFParagraphTest >> setUp [
	self doc: PDFDocument new.
	self page: PDFPage new.
	
	self paragraph: (PDFParagraphElement new 
		from: 10mm@10mm;
		dimension: 160mm@60mm; 
		text: 'Emensis itaque difficultatibus multis et nive obrutis callibus plurimis ubi prope Rauracum ventum est ad supercilia fluminis Rheni, resistente multitudine Alamanna pontem suspendere navium conpage Romani vi nimia vetabantur ritu grandinis undique convolantibus telis, et cum id inpossibile videretur, imperator cogitationibus magnis attonitus, quid capesseret ambigebat.').
		
	self page add: self paragraph.
	self doc add: self page.
	
	self doc generate.
]

{ #category : #'as yet unclassified' }
PDFParagraphTest >> tearDown [ 
]
