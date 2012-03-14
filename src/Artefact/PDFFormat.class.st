Class {
	#name : #PDFFormat,
	#superclass : #Object,
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFFormat >> height [
	"Answer the height of a page"
	^self size y
]

{ #category : #'as yet unclassified' }
PDFFormat >> margin [
	^28.35
]

{ #category : #'as yet unclassified' }
PDFFormat >> size [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
PDFFormat >> width [
	"Answer the width of the page"
	^self size x
]
