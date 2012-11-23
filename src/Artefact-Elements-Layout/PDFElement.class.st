Class {
	#name : #PDFElement,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'styleSheet'
	],
	#category : #'Artefact-Elements'
}

{ #category : #accessing }
PDFElement >> buffer [
	^ buffer
]

{ #category : #accessing }
PDFElement >> buffer: anObject [
	buffer := anObject
]

{ #category : #render }
PDFElement >> generateCodeSegmentArrayIn: aPage [
	"initialize the style and answer the style content. The style receive the document context and the current page"

	^ {self renderContentOn: aPage}
]

{ #category : #render }
PDFElement >> initStyle: aDocument [
	self subclassResponsibility 
]

{ #category : #'initialize-release' }
PDFElement >> initialize [ 
	super initialize.
	self buffer: OrderedCollection new.
	self styleSheet: PDFStyleSheet new.
	
]

{ #category : #private }
PDFElement >> out: aItem [
	"append the item (or a list of items) to the style"
	
	(aItem className = 'OrderedCollection') 
		ifTrue: [ aItem do: [ :aValue | self buffer add: aValue ] ]
		ifFalse: [ self buffer add: aItem ]
]

{ #category : #render }
PDFElement >> produceElementCodeOn: aPage [
	self subclassResponsibility 
]

{ #category : #render }
PDFElement >> renderContentOn: aPage [
	^ PDFCodeSegment code: (self produceElementCodeOn: aPage) styleSheet: self styleSheet isDrawElement: self isDrawElement
]

{ #category : #accessing }
PDFElement >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFElement >> styleSheet: anObject [
	styleSheet := anObject
]
