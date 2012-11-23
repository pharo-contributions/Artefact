Class {
	#name : #PDFUnsecureCodeSegment,
	#superclass : #PDFCodeSegment,
	#instVars : [
		'styleSheet',
		'code'
	],
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFUnsecureCodeSegment >> isSecure [
	^ false
]
