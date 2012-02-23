Class {
	#name : #PDFStyle,
	#superclass : #Object,
	#instVars : [
		'buffer'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFStyle >> buffer [
	^ buffer
]

{ #category : #accessing }
PDFStyle >> buffer: anObject [
	buffer := anObject
]

{ #category : #render }
PDFStyle >> initStyle: aDocument [
	self subclassResponsibility
]

{ #category : #'initialize-release' }
PDFStyle >> initialize [ 
	super initialize.
	self buffer: OrderedCollection new.
	^self
]

{ #category : #render }
PDFStyle >> render: aDocument [
	self subclassResponsibility
]
