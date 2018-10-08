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
		'format',
		'code',
		'fontId',
		'opacityId'
	],
	#category : #'Artefact-Core-CodeSegment'
}

{ #category : #'initialize-release' }
PDFElementCodeSegment class >> code: aCode styleSheet: aStyleSheet format: aFormat isDrawElement: aBoolean fontId: aFontId opacityId: aOpacityId fromElement: aElement [
	^ self new
		format: aFormat;
		code: aCode;
		styleSheet: aStyleSheet;
		isDrawElement: aBoolean;
		fontId: aFontId;
		opacityId: aOpacityId;
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
PDFElementCodeSegment >> format [
	^ format
]

{ #category : #accessing }
PDFElementCodeSegment >> format: anObject [
	format := anObject
]

{ #category : #accessing }
PDFElementCodeSegment >> opacityId [
	^ opacityId
]

{ #category : #accessing }
PDFElementCodeSegment >> opacityId: anObject [
	opacityId := anObject
]

{ #category : #accessing }
PDFElementCodeSegment >> printWith: aPDFWriter [ 
	aPDFWriter printElementCodeSegment: self
]
