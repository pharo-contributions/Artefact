Class {
	#name : #PDFDataTableOld,
	#superclass : #PDFComposite,
	#instVars : [
		'elements',
		'data',
		'margin'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #action }
PDFDataTableOld >> buildValue: aValue [
	"answer a PDFCellStyle instance for a value datatable cell"

	^ PDFCellElement new
		wh: (self wh);
		text: (aValue);
		margin: (self margin)
]

{ #category : #accessing }
PDFDataTableOld >> data [
	^data
]

{ #category : #accessing }
PDFDataTableOld >> data: anArray [
	data := anArray
]

{ #category : #'initialize-release' }
PDFDataTableOld >> defaultStyle [
	^ #datatable
]

{ #category : #'initialize-release' }
PDFDataTableOld >> initialize [
	super initialize.
	elements := OrderedCollection new.
]

{ #category : #accessing }
PDFDataTableOld >> margin [
	^margin ifNil: [ margin := 1 point ]
]

{ #category : #accessing }
PDFDataTableOld >> margin: aMargin [
	margin := aMargin
]
