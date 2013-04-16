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
	| page pageDataType contentDataType document |
	document := PDFDocument new noCompression.
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

{ #category : #'as yet unclassified' }
PDFGeneratorTest >> testGenerateFontID [
	self assert: generator generateFontId equals: 'F1'.
	self assert: generator generateFontId equals: 'F2'.
	self assert: generator generateFontId equals: 'F3'
]

{ #category : #'as yet unclassified' }
PDFGeneratorTest >> testGeneratePDFDocument [
	
	| pdfObject |
	pdfObject := PDFDocument new noCompression; format: PDFA3Format new; generate.
	self assert: pdfObject asString withUnixLineEndings equals: '1 0 obj
<<
/Type /Pages
/Kids [ ]
/Count 0
/MediaBox [ 0 0 841.89 1190.55 ]
/Resources <<
/ProcSet [ /PDF /Text /ImageC ]
/Font <<
>>
/XObject <<
>>
>>
>>
endobj' withUnixLineEndings
]

{ #category : #'as yet unclassified' }
PDFGeneratorTest >> testGeneratePDFFormat [
	| dataType format elements |
	format := PDFA3Format new setLandscape.
	dataType := generator generatePDFFormat: format.
	self assert: dataType class equals: PDFDataCouple.
	self assert: dataType key class equals: PDFDataSymbol.
	self assert: dataType key symbol equals: 'MediaBox'.
	self assert: dataType value class equals: PDFDataArray.
	elements := dataType value elements.
	self assert: (elements first closeTo: 0).
	self assert: (elements second closeTo: 0).
	self assert: (elements third closeTo: format width).
	self assert: (elements fourth closeTo: format height)
]

{ #category : #'as yet unclassified' }
PDFGeneratorTest >> testGeneratePDFVersion [
	| dataType version |
	version := '1.3'.
	dataType:= generator generatePDFVersion: version.
	self assert: dataType class equals: PDFDataComment.
]
