Class {
	#name : #PDFByteCode,
	#superclass : #Object,
	#category : #Artefact
}

{ #category : #text }
PDFByteCode class >> beginText [
	^'BT'
]

{ #category : #text }
PDFByteCode class >> continuousPagesDisplayMode [
	^ '/OneColumn '
]

{ #category : #draw }
PDFByteCode class >> curve [
	^'c'
]

{ #category : #style }
PDFByteCode class >> dotted [
	^'d'
]

{ #category : #style }
PDFByteCode class >> drawWithColor [
	^'RG'
]

{ #category : #style }
PDFByteCode class >> drawWithGreyLevel [
	^'G'
]

{ #category : #text }
PDFByteCode class >> endOfText [
	^'ET'
]

{ #category : #style }
PDFByteCode class >> fillWithColor [
	^'rg'
]

{ #category : #style }
PDFByteCode class >> fillWithGreyLevel [
	^'g'
]

{ #category : #draw }
PDFByteCode class >> filling [
	^'B'
]

{ #category : #draw }
PDFByteCode class >> line [
	^'l'
]

{ #category : #style }
PDFByteCode class >> lineCapStyle [
	^'J'
]

{ #category : #draw }
PDFByteCode class >> moveTo [
	^'m'
]

{ #category : #draw }
PDFByteCode class >> noFilling [
	^'S'
]

{ #category : #style }
PDFByteCode class >> openAction [
	^'/OpenAction'
]

{ #category : #text }
PDFByteCode class >> pageLayout [
	^ '/PageLayout'
]

{ #category : #draw }
PDFByteCode class >> rectangle [
	^'re'
]

{ #category : #text }
PDFByteCode class >> setTextPosition [
	^'Td'
]

{ #category : #text }
PDFByteCode class >> showTextString [
	^'Tj'
]

{ #category : #text }
PDFByteCode class >> singlePageDisplayMode [
	^ '/SinglePage '
]

{ #category : #style }
PDFByteCode class >> thickness [
	^'w'
]

{ #category : #text }
PDFByteCode class >> twoPagesDisplayMode [
	^ '/TwoColumnLeft '
]
