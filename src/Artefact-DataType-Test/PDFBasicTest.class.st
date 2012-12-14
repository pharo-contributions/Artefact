Class {
	#name : #PDFBasicTest,
	#superclass : #TestCase,
	#instVars : [
		'element'
	],
	#category : #'Artefact-Test'
}

{ #category : #accessing }
PDFBasicTest >> element [
	^ element
]

{ #category : #accessing }
PDFBasicTest >> element: anObject [
	element := anObject
]

{ #category : #'as yet unclassified' }
PDFBasicTest >> setUp [
	self element: PDFBasic new.
]

{ #category : #'as yet unclassified' }
PDFBasicTest >> testSplitCoordinates [
	self assert: (self element splitCoordinates: 20@30) = '20 30'.
]
