Class {
	#name : #PDFVersion,
	#superclass : #PDFDocumentElement,
	#category : #'Artefact-Elements-Document-Basics'
}

{ #category : #'as yet unclassified' }
PDFVersion >> produceDocumentElementCodeOn: aDocument [
	^ '%PDF-1.3'
]
