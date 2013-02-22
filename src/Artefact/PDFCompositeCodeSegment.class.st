Class {
	#name : #PDFCompositeCodeSegment,
	#superclass : #PDFCodeSegment,
	#instVars : [
		'segments'
	],
	#category : #'Artefact-CodeSegment'
}

{ #category : #'as yet unclassified' }
PDFCompositeCodeSegment class >> from: aCollectionOfSegments styleSheet: aStylesheet [
	^ self new segments: aCollectionOfSegments; styleSheet: aStylesheet; yourself
]

{ #category : #accessing }
PDFCompositeCodeSegment >> segments [
	^ segments
]

{ #category : #accessing }
PDFCompositeCodeSegment >> segments: anObject [
	segments := anObject
]