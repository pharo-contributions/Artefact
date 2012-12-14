Class {
	#name : #PDFDocumentElement,
	#superclass : #PDFElement,
	#category : #'Artefact-Elements'
}

{ #category : #builder }
PDFDocumentElement >> generateCodeSegmentWithParent: aDocument [
	^ PDFElementCodeSegment new code: (self produceDocumentElementCodeOn: aDocument)
]

{ #category : #builder }
PDFDocumentElement >> produceDocumentElementCodeOn: aDocument [
	^ self subclassResponsibility
]
