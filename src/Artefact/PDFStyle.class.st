Class {
	#name : #PDFStyle,
	#superclass : #Object,
	#instVars : [
		'xy',
		'destination',
		'wh',
		'text',
		'width'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFStyle >> destination [
	^ destination
]

{ #category : #accessing }
PDFStyle >> destination: anObject [
	destination := anObject
]

{ #category : #accessing }
PDFStyle >> from [
	^ from
]

{ #category : #accessing }
PDFStyle >> from: anObject [
	from := anObject
]

{ #category : #render }
PDFStyle >> render [
	self subclassResponsibility
]

{ #category : #accessing }
PDFStyle >> text [
	^ text
]

{ #category : #accessing }
PDFStyle >> text: anObject [
	text := anObject
]

{ #category : #accessing }
PDFStyle >> wh [
	^ wh
]

{ #category : #accessing }
PDFStyle >> wh: anObject [
	wh := anObject
]

{ #category : #accessing }
PDFStyle >> width [
	^ width
]

{ #category : #accessing }
PDFStyle >> width: anObject [
	width := anObject
]

{ #category : #accessing }
PDFStyle >> xy [
	^ xy
]

{ #category : #accessing }
PDFStyle >> xy: anObject [
	xy := anObject
]
