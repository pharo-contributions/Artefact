Class {
	#name : #PDFDataTypeTest,
	#superclass : #TestCase,
	#instVars : [
		'aStream'
	],
	#category : #'Artefact-DataType-Test'
}

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> assert: aPDFDataType print: aString [
	aPDFDataType printOn: aStream.
	self assert: aStream contents equals: aString
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> setUp [
	aStream := WriteStream on: ''.
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataArray [
	| dataArray |
	dataArray := PDFDataArray new.
	dataArray addElement: (PDFDataValue value: 0).
	dataArray addElement: (PDFDataValue value: 0).
	dataArray addElement: (PDFDataValue value: 595.3).
	dataArray addElement: (PDFDataValue value: 841.9).
	self assert: dataArray print: '[ 0 0 595.3 841.9 ]'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataArrayEmpty [
	self assert: (PDFDataArray new) print: '[ ]'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataArrayReferencies [
	| dataArray |
	dataArray := PDFDataArray new.
	dataArray addElement: (PDFDataReference reference: (PDFDataObject new id: 2; revision: 0; yourself)).
	dataArray addElement: (PDFDataReference reference: (PDFDataObject new id: 5; revision: 0; yourself)).
	dataArray addElement: (PDFDataReference reference: (PDFDataObject new id: 8; revision: 0; yourself)).
	self assert: dataArray print: '[ 2 0 R 5 0 R 8 0 R ]'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataArraySymbols [
	| dataArray |
	dataArray := PDFDataArray new.
	dataArray addElement: (PDFDataSymbol symbol: 'PDF').
	dataArray addElement: (PDFDataSymbol symbol: 'Text').
	dataArray addElement: (PDFDataSymbol symbol: 'ImageC').
	self assert: dataArray print: '[ /PDF /Text /ImageC ]'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataAssociativeArray [
	| dataAssociativeArray dataArray |
	dataArray := PDFDataArray new.
	dataArray addElement: (PDFDataReference reference: (PDFDataObject new id: 2; revision: 0; yourself)).
	dataArray addElement: (PDFDataReference reference: (PDFDataObject new id: 5; revision: 0; yourself)).
	dataArray addElement: (PDFDataReference reference: (PDFDataObject new id: 8; revision: 0; yourself)).
	
	dataAssociativeArray := PDFDataAssociativeArray new.
	dataAssociativeArray add:( PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'Pages' )).
	dataAssociativeArray add:( PDFDataCouple key:  (PDFDataSymbol symbol: 'Kids') value: dataArray).
	dataAssociativeArray add:( PDFDataCouple key:  (PDFDataSymbol symbol: 'Count') value: (PDFDataValue value: 3)).
	
	self assert: dataAssociativeArray print: '<<',String crlf, '/Type /Pages',String crlf, '/Kids [ 2 0 R 5 0 R 8 0 R ]',String crlf, '/Count 3',String crlf, '>>'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataComment [
	self assert: (PDFDataComment text: 'PDF-1.3') print: '%PDF-1.3'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataCouple [
	|  couple dataArray |
	dataArray := PDFDataArray new.
	dataArray addElement: (PDFDataReference reference: (PDFDataObject new id: 2; revision: 0; yourself)).
	dataArray addElement: (PDFDataReference reference: (PDFDataObject new id: 5; revision: 0; yourself)).
	dataArray addElement: (PDFDataReference reference: (PDFDataObject new id: 8; revision: 0; yourself)).
	
	couple:= PDFDataCouple key: (PDFDataSymbol symbol: 'Kids') value: dataArray.
	
	self assert: couple print: '/Kids [ 2 0 R 5 0 R 8 0 R ]'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataReference [
	self assert: (PDFDataReference reference: (PDFDataObject new id: 42; revision: 0; yourself)) print: '42 0 R'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataSymbol [
	self assert: (PDFDataSymbol symbol: 'Type') print: '/Type'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataValueEmptyString [
	self assert: (PDFDataValue value: '') print: ''
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataValueNumber [
	self assert: (PDFDataValue value: 12) print: '12'
]

{ #category : #'as yet unclassified' }
PDFDataTypeTest >> testDataValueString [
	self assert: (PDFDataValue value: 'Olivier') print: 'Olivier'
]
