Class {
	#name : #PDFDocumentElement,
	#superclass : #PDFElement,
	#category : #'Artefact-Elements'
}

{ #category : #builder }
PDFDocumentElement >> produceDocumentElementCodeOn: aDocument [
	^ self subclassResponsibility
]

{ #category : #builder }
PDFDocumentElement >> renderContentOn: aDocument [
	^ PDFDocumentElementCodeSegment new code: (self produceDocumentElementCodeOn: aDocument)
]
