Class {
	#name : #PDFBasicTest,
	#superclass : #TestCase,
	#instVars : [
		'element'
	],
	#category : #'Artefact-Tests-Base'
}

{ #category : #accessing }
PDFBasicTest >> element [
	^ element
]

{ #category : #accessing }
PDFBasicTest >> element: anObject [
	element := anObject
]

{ #category : #running }
PDFBasicTest >> setUp [
	self element: PDFDummyBasic new.
]

{ #category : #tests }
PDFBasicTest >> testSplitCoordinates [
	self assert: (self element splitCoordinates: 20@30) = '20 30'.
]
