"
A PDFDummyBasic is a dummy element for testing.

Instance Variables

"
Class {
	#name : #PDFDummyBasic,
	#superclass : #PDFBasic,
	#category : #'Artefact-Core-Tests-Base'
}

{ #category : #style }
PDFDummyBasic >> defaultStyle [

 	^ #default
]

{ #category : #testing }
PDFDummyBasic >> isDrawElement [

	^ true
]

{ #category : #render }
PDFDummyBasic >> producePageElementCodeWith: aPDFGenerator StyleSheet: aStyleSheet [
	"Do nothing here"
]
