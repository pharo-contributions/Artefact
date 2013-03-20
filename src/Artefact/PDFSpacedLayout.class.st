Class {
	#name : #PDFSpacedLayout,
	#superclass : #PDFLayout,
	#instVars : [
		'spacing'
	],
	#category : #'Artefact-Elements-Layouts'
}

{ #category : #'as yet unclassified' }
PDFSpacedLayout >> defaultSpacing [

	^ 5 pt
]

{ #category : #'as yet unclassified' }
PDFSpacedLayout >> initialize [ 
	super initialize.
	spacing := self defaultSpacing.
]

{ #category : #accessing }
PDFSpacedLayout >> spacing [
	^ spacing
]

{ #category : #accessing }
PDFSpacedLayout >> spacing: anObject [
	spacing := anObject
]
