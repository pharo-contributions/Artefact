Class {
	#name : #PDFElementCodeSegment,
	#superclass : #PDFCodeSegment,
	#instVars : [
		'code',
		'fontId'
	],
	#category : #'Artefact-CodeSegment'
}

{ #category : #'as yet unclassified' }
PDFElementCodeSegment class >> code: aString styleSheet: aPDFStyleSheet fontId: aFontId [
	^ self new
		code: aString;
		fontId: aFontId;
		styleSheet: aPDFStyleSheet;
		yourself
]

{ #category : #'initialize-release' }
PDFElementCodeSegment class >> code: aCode styleSheet: aStyleSheet isDrawElement: aBoolean [
	^ self new code: aCode; styleSheet: aStyleSheet; isDrawElement: aBoolean; yourself 
]

{ #category : #accessing }
PDFElementCodeSegment >> code [
	^ code
]

{ #category : #accessing }
PDFElementCodeSegment >> code: anObject [
	code := anObject
]

{ #category : #accessing }
PDFElementCodeSegment >> fontId [
	^ fontId
]

{ #category : #accessing }
PDFElementCodeSegment >> fontId: anObject [
	fontId := anObject
]

{ #category : #accessing }
PDFElementCodeSegment >> printWith: aPDFWriter [ 
	aPDFWriter printElementCodeSegment: self
]
