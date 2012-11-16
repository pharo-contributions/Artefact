Class {
	#name : #PDFByteCode,
	#superclass : #Object,
	#category : #Artefact
}

{ #category : #text }
PDFByteCode class >> beginText [
	^'BT'
]

{ #category : #draw }
PDFByteCode class >> curve [
	^'c'
]

{ #category : #text }
PDFByteCode class >> endOfText [
	^'ET'
]

{ #category : #draw }
PDFByteCode class >> filling [
	^'B'
]

{ #category : #draw }
PDFByteCode class >> line [
	^'l'
]

{ #category : #draw }
PDFByteCode class >> moveTo [
	^'m'
]

{ #category : #draw }
PDFByteCode class >> noFilling [
	^'S'
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
