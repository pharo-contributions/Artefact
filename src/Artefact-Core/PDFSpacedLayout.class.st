"
A PDFSpacedLayout is the abstract class for each layout with space between contained elements.

Instance Variables
	spacing:		<Object>

spacing
	- xxxxx

"
Class {
	#name : #PDFSpacedLayout,
	#superclass : #PDFLayout,
	#instVars : [
		'spacing'
	],
	#category : #'Artefact-Core-Layouts'
}

{ #category : #'initialize-release' }
PDFSpacedLayout >> defaultSpacing [

	^ 5 pt
]

{ #category : #'initialize-release' }
PDFSpacedLayout >> initialize [ 
	super initialize.
	spacing := self defaultSpacing.
]

{ #category : #checking }
PDFSpacedLayout >> requiredAttributes [
	^ #( from spacing )
]

{ #category : #accessing }
PDFSpacedLayout >> spacing [
	^ spacing
]

{ #category : #accessing }
PDFSpacedLayout >> spacing: anObject [
	spacing := anObject
]
