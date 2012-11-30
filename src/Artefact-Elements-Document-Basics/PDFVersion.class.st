Class {
	#name : #PDFVersion,
	#superclass : #PDFDocumentBasicElement,
	#category : #'Artefact-Elements-Document-Basics'
}

{ #category : #'as yet unclassified' }
PDFVersion >> produceDocumentElementCodeOn: aDocument [
	^ '%PDF-1.3'
]
