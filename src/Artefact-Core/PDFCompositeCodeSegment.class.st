"
A PDFCompositeCodeSegment is a composition of PDFCodeSegment, result of the generation of a PDFCompositeElement.

Instance Variables
	segments:		<Object>

segments
	- xxxxx

"
Class {
	#name : #PDFCompositeCodeSegment,
	#superclass : #PDFCodeSegment,
	#instVars : [
		'segments'
	],
	#category : #'Artefact-Core-CodeSegment'
}

{ #category : #'as yet unclassified' }
PDFCompositeCodeSegment class >> from: aCollectionOfSegments styleSheet: aStylesheet [
	^ self new segments: aCollectionOfSegments; styleSheet: aStylesheet; yourself
]

{ #category : #accessing }
PDFCompositeCodeSegment >> printWith: aPDFWriter [ 
	aPDFWriter printCompositeCodeSegment: self
]

{ #category : #accessing }
PDFCompositeCodeSegment >> segments [
	^ segments
]

{ #category : #accessing }
PDFCompositeCodeSegment >> segments: anObject [
	segments := anObject
]
