Class {
	#name : #PDFGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'generator'
	],
	#category : #'Artefact-Generator-Test'
}

{ #category : #'as yet unclassified' }
PDFGeneratorTest >> setUp [
	generator := PDFGenerator new.
]

{ #category : #'as yet unclassified' }
PDFGeneratorTest >> testGenerateEmptyPage [
	| page pageDataType contentDataType |
	page:= PDFPage new format: (PDFA4Format new).
	pageDataType:= generator generatePDFPage: page.
	self assert: pageDataType class equals: PDFDataObject.
	self assert: pageDataType id equals: 1.
	self assert: pageDataType revision equals: 0.
	self assert: pageDataType contents class equals: PDFDataReference.
	contentDataType:= pageDataType contents referencedObject .
	self assert: contentDataType class equals: PDFDataObject.
	self assert: pageDataType id equals: 2.
	self assert: pageDataType revision equals: 0.
]

{ #category : #'as yet unclassified' }
PDFGeneratorTest >> testGeneratePDFEOF [
	| dataType eof |
	eof := '%EOF'.
	dataType:= generator generatePDFEOF: eof.
	self assert: dataType class equals: PDFDataComment.
]

{ #category : #'as yet unclassified' }
PDFGeneratorTest >> testGeneratePDFFormat [
	| dataType format |
	format := PDFA3Format new setLandscape.
	dataType:= generator generatePDFFormat: format.
	self assert: dataType class equals: PDFDataCouple.
	self assert: dataType key class equals: PDFDataSymbol.
	self assert: dataType key symbol equals: 'MediaBox'.
	self assert: dataType value class equals: PDFDataArray.
	self assert: dataType value elements equals: { 0 . 0 . format width . format height }
]

{ #category : #'as yet unclassified' }
PDFGeneratorTest >> testGeneratePDFVersion [
	| dataType version |
	version := '1.3'.
	dataType:= generator generatePDFVersion: version.
	self assert: dataType class equals: PDFDataComment.
]
