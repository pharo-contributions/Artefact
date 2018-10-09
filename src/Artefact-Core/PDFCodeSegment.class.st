"
A PDFCodeSegment is the intermediate representation of a PDFElement resulting from the generation with PDFGenerator. It contains a styleSheet that the PDFStreamPrinter must convert in pdf.

Instance Variables
	isDrawElement:		<Object>
	styleSheet:		<Object>

isDrawElement
	- xxxxx

styleSheet
	- xxxxx

"
Class {
	#name : #PDFCodeSegment,
	#superclass : #Object,
	#instVars : [
		'styleSheet',
		'isDrawElement',
		'fromElement'
	],
	#category : #'Artefact-Core-CodeSegment'
}

{ #category : #accessing }
PDFCodeSegment >> fromElement [
	^ fromElement
]

{ #category : #accessing }
PDFCodeSegment >> fromElement: anPDFElement [
	fromElement := anPDFElement
]

{ #category : #accessing }
PDFCodeSegment >> isDrawElement [
	^ isDrawElement
]

{ #category : #accessing }
PDFCodeSegment >> isDrawElement: anObject [
	isDrawElement := anObject
]

{ #category : #accessing }
PDFCodeSegment >> isSecure [
	^ true
]

{ #category : #accessing }
PDFCodeSegment >> printWith: aPDFWriter [ 
	^ self subclassResponsibility 
]

{ #category : #accessing }
PDFCodeSegment >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFCodeSegment >> styleSheet: anObject [
	styleSheet := anObject
]
