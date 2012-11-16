Class {
	#name : #PDFComposite,
	#superclass : #PDFVisibleItem,
	#instVars : [
		'page'
	],
	#category : #'Artefact-Elements'
}

{ #category : #'as yet unclassified' }
PDFComposite >> getStyles [
	""
	self subclassResponsibility
]

{ #category : #accessing }
PDFComposite >> page [
	^page
]

{ #category : #accessing }
PDFComposite >> page: aPageObject [
	page := aPageObject
]

{ #category : #'as yet unclassified' }
PDFComposite >> renderIn: aPage [
	self page: aPage.
	
	^ (self getStyles) inject: {} into: [ :str :aStyle | str, (aStyle renderIn: aPage)].
	
]
