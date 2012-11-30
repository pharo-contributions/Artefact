Class {
	#name : #PDFElement,
	#superclass : #Object,
	#category : #'Artefact-Elements'
}

{ #category : #render }
PDFElement >> generateCodeSegmentArrayIn: aPage [
	"initialize the style and answer the style content. The style receive the document context and the current page"

	^ {self renderContentOn: aPage}
]

{ #category : #render }
PDFElement >> renderContentOn: anArtefactEntity [
	^ self subclassResponsibility
]
