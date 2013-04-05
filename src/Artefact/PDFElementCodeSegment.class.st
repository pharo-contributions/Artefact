"
A PDFElementCodeSegment is the result of the generation of a PDFBasicElement. It contains a code that can be directly printed in the stream by the PDFStreamPrinter.

Instance Variables
	code:		<Object>
	fontId:		<Object>

code
	- xxxxx

fontId
	- xxxxx

"
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
PDFElementCodeSegment class >> code: aCode styleSheet: aStyleSheet isDrawElement: aBoolean fontId: aFontId fromElement: aElement [
	^ self new
		code: aCode;
		styleSheet: aStyleSheet;
		isDrawElement: aBoolean;
		fontId: aFontId;
		fromElement: aElement;
		yourself
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
