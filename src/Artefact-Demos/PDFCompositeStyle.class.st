Class {
	#name : #PDFCompositeStyle,
	#superclass : #PDFVisibleItem,
	#category : #'Artefact-Styles'
}

{ #category : #'as yet unclassified' }
PDFCompositeStyle >> getStyles: aPage [
	""
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
PDFCompositeStyle >> renderIn: aPage [
	^ (self getStyles: aPage) inject: {} into: [ :str :aStyle | str, (aStyle renderIn: aPage)].
	
]
