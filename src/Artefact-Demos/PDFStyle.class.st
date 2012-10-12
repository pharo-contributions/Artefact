Class {
	#name : #PDFStyle,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'styleSheet'
	],
	#category : #'Artefact-Styles'
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
	self styleSheet: PDFStyleSheet new.
	
]

{ #category : #private }
PDFStyle >> out: aItem [
	"append the item (or a list of items) to the style"
	
	(aItem className = 'OrderedCollection') 
		ifTrue: [ aItem do: [ :aValue | self buffer add: aValue ] ]
		ifFalse: [ self buffer add: aItem ]
]

{ #category : #render }
PDFStyle >> renderContentOn: aPage [
	self subclassResponsibility
]

{ #category : #render }
PDFStyle >> renderIn: aPage [
	"initialize the style and answer the style content. The style receive the document context and the current page"
	
	self initStyle: aPage document.
	
	^(self renderContentOn: aPage)
]

{ #category : #accessing }
PDFStyle >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFStyle >> styleSheet: anObject [
	styleSheet := anObject
]
