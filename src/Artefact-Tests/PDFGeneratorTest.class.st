Class {
	#name : #PDFGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'generator'
	],
	#category : #'Artefact-Tests-Generator'
}

{ #category : #running }
PDFGeneratorTest >> setUp [
	generator := PDFGenerator new.
]

{ #category : #tests }
PDFGeneratorTest >> testGenerateEmptyPage [
	| page pageDataType contentDataType document |
	document := PDFDocument new uncompressed.
	page := PDFPage new format: PDFA4Format new.
	document add: page.
	generator := PDFGenerator new compression: false.
	generator generatePDFDocument: PDFDocument new.
	pageDataType := generator generatePDFPage: page.
	self assert: pageDataType class equals: PDFDataObject.
	self assert: pageDataType id equals: 2.
	self assert: pageDataType revision equals: 0.
	self assert: pageDataType contents first class equals: PDFDataAssociativeArray.
	contentDataType := pageDataType contents first associativeArray fourth value.
	self assert: contentDataType class equals: PDFDataReference.
	self assert: contentDataType referencedObject id equals: 3.
	self assert: contentDataType referencedObject revision equals: 0
]

{ #category : #tests }
PDFGeneratorTest >> testGenerateFontID [
	self assert: generator generateFontId equals: 'F1'.
	self assert: generator generateFontId equals: 'F2'.
	self assert: generator generateFontId equals: 'F3'
]

{ #category : #tests }
PDFGeneratorTest >> testGeneratePDFFormat [
	| dataType format elements |
	format := PDFA3Format new setLandscape.
	dataType := generator generatePDFFormat: format.
	self assert: dataType class equals: PDFDataCouple.
	self assert: dataType key class equals: PDFDataSymbol.
	self assert: dataType key symbol equals: 'MediaBox'.
	self assert: dataType value class equals: PDFDataArray.
	elements := dataType value elements.
	self assert: (elements first value closeTo: 0).
	self assert: (elements second value closeTo: 0).
	self assert: (elements third value pt closeTo: format width).
	self assert: (elements fourth value pt closeTo: format height)
]

{ #category : #tests }
PDFGeneratorTest >> testGeneratePDFVersion [
	| dataType version |
	version := '1.3'.
	dataType:= generator generatePDFVersion: version.
	self assert: dataType class equals: PDFDataComment.
]
