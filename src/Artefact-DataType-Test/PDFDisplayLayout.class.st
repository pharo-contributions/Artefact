Class {
	#name : #PDFDisplayLayout,
	#superclass : #PDFDocumentElement,
	#instVars : [
		'layout'
	],
	#category : #'Artefact-Elements-Document-Basics'
}

{ #category : #private }
PDFDisplayLayout >> argsByDisplayLayoutDictionary [
	^Dictionary new
		at: #default put:  '';
		at: #singlePage put: PDFByteCode singlePageDisplayMode;
		at: #continuousPages put: PDFByteCode continuousPagesDisplayMode;
		at: #twoPages put: PDFByteCode twoPagesDisplayMode;
		yourself.
]

{ #category : #configuration }
PDFDisplayLayout >> continuousPages [
	self layout: #continuousPages
	
]

{ #category : #configuration }
PDFDisplayLayout >> default [
	self layout: #default
	
]

{ #category : #'initialize-release' }
PDFDisplayLayout >> initialize [ 
	super initialize.
	self layout: #default
]

{ #category : #builder }
PDFDisplayLayout >> isDefault [
	^ self layout = #default
]

{ #category : #accessing }
PDFDisplayLayout >> layout [
	^ layout
]

{ #category : #accessing }
PDFDisplayLayout >> layout: anObject [
	layout := anObject
]

{ #category : #builder }
PDFDisplayLayout >> produceDocumentElementCodeOn: aDocument [
	^(String streamContents: [ :s | self isDefault ifFalse: [
		s nextPutAll: PDFByteCode pageLayout; 
		space; 
		nextPutAll: (self argsByDisplayLayoutDictionary at: layout).]
	] )
]

{ #category : #configuration }
PDFDisplayLayout >> singlePage [
	self layout: #singlePage
	
]

{ #category : #configuration }
PDFDisplayLayout >> twoPages [
	self layout: #twoPages
	
]
