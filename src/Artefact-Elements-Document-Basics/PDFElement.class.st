Class {
	#name : #PDFElement,
	#superclass : #Object,
	#category : #'Artefact-Elements'
}

{ #category : #render }
PDFElement >> escape: aString [
	"answer a clean string at PDF format"
	
	| str |
	str := aString copyWithRegex: '\\' matchesReplacedWith: '\\\'.	
	str := str copyWithRegex: '\(' matchesReplacedWith: '\('.
	str := str copyWithRegex: '\)' matchesReplacedWith: '\)'.

	^str
]

{ #category : #render }
PDFElement >> formatString: aString [
	"Answer a formated text string"
	
	^('(' , (self escape: (aString asString)) , ')')
]

{ #category : #render }
PDFElement >> generateCodeSegmentArrayIn: aPage [
	"initialize the style and answer the style content. The style receive the document context and the current page"

	^ {self generateCodeSegmentWithParent: aPage}
]

{ #category : #render }
PDFElement >> generateCodeSegmentWithParent: anArtefactEntity [
	^ self subclassResponsibility
]

{ #category : #render }
PDFElement >> generateWith: aPDFGenerator on: aWriteStream [ 
	aPDFGenerator generatePDFElement: self on: aWriteStream
]

{ #category : #render }
PDFElement >> produceLinesFrom: aCollection [
	^ (aCollection inject: '' into:  [ :str :aValue |  str, (aValue, String crlf) ]) allButLast allButLast 
]
