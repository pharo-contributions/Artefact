"
An ArtefactUndefinedAttribute is the exception send when a non optional field is not filled.

Instance Variables
	attribute:		<Object>
	element:		<Object>

attribute
	- xxxxx

element
	- xxxxx

"
Class {
	#name : #ArtefactUndefinedAttribute,
	#superclass : #ArtefactException,
	#instVars : [
		'element',
		'attribute'
	],
	#category : #'Artefact-Core-Exceptions'
}

{ #category : #signaling }
ArtefactUndefinedAttribute class >> signalMissingAttribute: anAttribute for: aPDFElement [
	self new
		attribute: anAttribute;
		element: aPDFElement;
		signal
]

{ #category : #accessing }
ArtefactUndefinedAttribute >> attribute [
	^ attribute
]

{ #category : #accessing }
ArtefactUndefinedAttribute >> attribute: anObject [
	attribute := anObject
]

{ #category : #accessing }
ArtefactUndefinedAttribute >> element [
	^ element
]

{ #category : #accessing }
ArtefactUndefinedAttribute >> element: anObject [
	element := anObject
]

{ #category : #accessing }
ArtefactUndefinedAttribute >> messageText [
	^ String
		streamContents: [ :aStream | 
			self element printOn: aStream.
			aStream nextPutAll: ' -> '.
			self attribute printOn: aStream ]
]

{ #category : #printing }
ArtefactUndefinedAttribute >> printOn: aStream [
	super printOn: aStream.
	aStream space.
	self element printOn: aStream.
	aStream nextPutAll: ' -> '.
	self attribute printOn: aStream.
]
