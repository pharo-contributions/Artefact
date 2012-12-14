Class {
	#name : #PDFEOF,
	#superclass : #PDFDocumentElement,
	#category : #'Artefact-Elements-Document-Basics'
}

{ #category : #'as yet unclassified' }
PDFEOF >> produceDocumentElementCodeOn: aDocument [
	^ '%%EOF'
]
