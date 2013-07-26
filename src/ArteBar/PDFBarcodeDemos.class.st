Class {
	#name : #PDFBarcodeDemos,
	#superclass : #Object,
	#category : #ArteBar
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

	| pdfdoc aPage barcode1 barcode2 |
	barcode1 := (BarCodeElement from: 2cm@2cm to: 10cm@4cm) ean13; value: '0332960073452'.
	barcode2 := (BarCodeElement from: 2cm@6cm to: 5cm@8cm) ean13; value: '0332960073452'.
	pdfdoc := PDFDocument new.
	aPage := PDFPage new.
	aPage add: barcode1; add: barcode2.
	pdfdoc add: aPage.
	pdfdoc styleSheet drawColor: (PDFColor r: 0 g: 0 b: 0).
pdfdoc exportTo: aStream

]
