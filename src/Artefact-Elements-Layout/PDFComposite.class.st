Class {
	#name : #PDFComposite,
	#superclass : #PDFVisibleItem,
	#instVars : [
		'page'
	],
	#category : #'Artefact-Elements'
}

{ #category : #accessing }
PDFComposite >> dotted: aPDFDottedObject [
	self styleSheet dotted: aPDFDottedObject
]

{ #category : #accessing }
PDFComposite >> dottedIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #dotted ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFComposite >> drawColor: aColor [
	self styleSheet drawColor: aColor
]

{ #category : #accessing }
PDFComposite >> drawColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #drawColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFComposite >> fillColor: aColor [
	self styleSheet fillColor: aColor
]

{ #category : #accessing }
PDFComposite >> fillColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #fillColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFComposite >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #accessing }
PDFComposite >> fontIfAbsent: aStyleSheet. [
	^ (self styleSheet get: #font ifAbsentFrom: aStyleSheet)
]

{ #category : #render }
PDFComposite >> getSubElements [
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

{ #category : #render }
PDFComposite >> renderIn: aPage [
	self page: aPage.
	
	^ (self getSubElements) inject: {} into: [ :str :aStyle | str, (aStyle renderIn: aPage)].
	
]

{ #category : #accessing }
PDFComposite >> textColor: aColor [
	self styleSheet textColor: aColor
]

{ #category : #accessing }
PDFComposite >> textColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #textColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFComposite >> thickness: aThickness [
	self styleSheet thickness: aThickness 
 
]

{ #category : #accessing }
PDFComposite >> thicknessIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #thickness ifAbsentFrom: anAlternativeStyleSheet 
]
