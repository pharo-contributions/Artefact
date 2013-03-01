Class {
	#name : #PDFElementCodeSegment,
	#superclass : #PDFCodeSegment,
	#instVars : [
		'code',
		'fontId'
	],
	#category : #'Artefact-CodeSegment'
}

{ #category : #'initialize-release' }
PDFElementCodeSegment class >> code: aCode styleSheet: aStyleSheet isDrawElement: aBoolean fontId: aFontId [
	^ self new code: aCode; styleSheet: aStyleSheet; isDrawElement: aBoolean; fontId: aFontId; yourself 
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
