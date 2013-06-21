Class {
	#name : #PDFBarcodeDemos,
	#superclass : #Object,
	#category : #'Artefact-Barcodes'
}

{ #category : #tool }
PDFBarcodeDemos class >> demoPath [
	^ 'pdf/'

]

{ #category : #barcode }
PDFBarcodeDemos class >> ean13Test [
	"
	PDFBarcodeDemos ean13Test
	"
	self new ean13Test: (self streamNamed: 'ean13Test.pdf')
]

{ #category : #tool }
PDFBarcodeDemos class >> streamNamed: aName [
	| path |
	path := self demoPath asFileReference.
	path exists ifFalse: [ path createDirectory ]. 
	^ FileStream fileNamed: self demoPath , aName
]

{ #category : #barcode }
PDFBarcodeDemos >> ean13Test: aStream [
	"drawing an EAN13"

	| pdfdoc aPage barcode sequence |
	barcode := BarcodeEAN13 value: '2109876543210'.
	sequence := barcode binarySequence.
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	sequence withIndexDo: [:each :index |
		each = $1 ifTrue: [
			aPage add: (PDFLineElement 
				from: (20+index) pt @ 50 pt 
				to: (20+index) pt @ 20 pt). ] ].
	pdfdoc add: aPage.
	pdfdoc styleSheet drawColor: (PDFColor r: 0 g: 0 b: 0).
pdfdoc exportTo: aStream

]
