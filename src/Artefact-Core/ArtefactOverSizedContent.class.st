"
An ArtefactOverSizedContent indicate a content too large for its container.

Instance Variables
	content:		<Object>

content
	- xxxxx

"
Class {
	#name : #ArtefactOverSizedContent,
	#superclass : #ArtefactException,
	#instVars : [
		'content'
	],
	#category : #'Artefact-Core-Exceptions'
}

{ #category : #accessing }
ArtefactOverSizedContent >> content [
	^ content
]

{ #category : #accessing }
ArtefactOverSizedContent >> content: anObject [
	content := anObject
]

{ #category : #printing }
ArtefactOverSizedContent >> printOn: aStream [
	super printOn: aStream.
	aStream space.
	self content printOn: aStream
]
