Class {
	#name : #PDFCompositeStyle,
	#superclass : #PDFVisibleItem,
	#instVars : [
		'page'
	],
	#category : #'Artefact-Styles'
}

{ #category : #'as yet unclassified' }
PDFCompositeStyle >> getStyles [
	""
	self subclassResponsibility
]

{ #category : #accessing }
PDFCompositeStyle >> page [
	^page
]

{ #category : #accessing }
PDFCompositeStyle >> page: aPageObject [
	page := aPageObject
]

{ #category : #'as yet unclassified' }
PDFCompositeStyle >> renderIn: aPage [
	self page: aPage.
	
	^ (self getStyles) inject: {} into: [ :str :aStyle | str, (aStyle renderIn: aPage)].
	
]
