"
A PDFGenerator has the responsibility to transform a PDFDocument and all the PDFElement inside into many PDFDataType.

Instance Variables

"
Class {
	#name : #PDFGenerator,
	#superclass : #Object,
	#category : #'Artefact-Generator'
}

{ #category : #'as yet unclassified' }
PDFGenerator >> generatePDFEOF [
	^ PDFDataComment new comment: '%EOF'.
		
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generatePDFFormat: aPDFFormat [
	^ PDFDataCouple new
		key: (PDFDataSymbol symbol: 'MediaBox');
		value: (PDFDataArray from: {0 . 0 . aPDFFormat width . aPDFFormat height } )
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generatePDFVersion: aPDFVersion [
	^ PDFDataComment new comment: ('PDF-' , aPDFVersion).
		
]
