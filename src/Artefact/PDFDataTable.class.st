Class {
	#name : #PDFDataTable,
	#superclass : #PDFComposite,
	#instVars : [
		'elements',
		'data',
		'margin'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFDataTable >> buildValue: aValue [
	"answer a PDFCellStyle instance for a value datatable cell"

	^PDFCellElement new
		styleSheet: (self styleSheet copy);
		wh: (self wh);
		text: (aValue);
		margin: (self margin)
]

{ #category : #accessing }
PDFDataTable >> data [
	^data
]

{ #category : #accessing }
PDFDataTable >> data: anArray [
	data := anArray
]

{ #category : #'initialize-release' }
PDFDataTable >> initialize [
	super initialize.
	elements := OrderedCollection new.
]

{ #category : #accessing }
PDFDataTable >> margin [
	^margin ifNil: [ margin := 1 point ]
]

{ #category : #accessing }
PDFDataTable >> margin: aMargin [
	margin := aMargin
]
