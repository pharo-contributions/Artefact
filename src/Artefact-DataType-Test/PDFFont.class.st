Class {
	#name : #PDFFont,
	#superclass : #Object,
	#instVars : [
		'bold',
		'italic',
		'fontSize',
		'pdfDocument'
	],
	#category : #'Artefact-Fonts'
}

{ #category : #accessing }
PDFFont >> bold [
	^ bold ifNil: [ bold = false ]
]

{ #category : #accessing }
PDFFont >> bold: anObject [
	bold := anObject
]

{ #category : #name }
PDFFont >> boldAndItalicName [
	^ self subclassResponsibility 
]

{ #category : #widths }
PDFFont >> boldAndItalicWidths [
	^ self subclassResponsibility
]

{ #category : #name }
PDFFont >> boldName [
	^ self subclassResponsibility 
]

{ #category : #widths }
PDFFont >> boldWidths [
	^ self subclassResponsibility
]

{ #category : #widths }
PDFFont >> charWidths [
	"Answer a collection of the width of each caracter"

	^ self bold
		ifTrue: [ 
			self italic
				ifTrue: [ self boldAndItalicWidths ]
				ifFalse: [ self boldWidths ] ]
		ifFalse: [ 
			self italic
				ifTrue: [ self italicWidths ]
				ifFalse: [ self classicWidths ] ]
]

{ #category : #name }
PDFFont >> classicName [
	^ self subclassResponsibility 
]

{ #category : #widths }
PDFFont >> classicWidths [
	^ self subclassResponsibility
]

{ #category : #accessing }
PDFFont >> family [
	"Answer the family name of the font"
	self subclassResponsibility
]

{ #category : #name }
PDFFont >> fontName [

	^ self bold
		ifTrue: [ 
			self italic
				ifTrue: [ self boldAndItalicName ]
				ifFalse: [ self boldName ] ]
		ifFalse: [ 
			self italic
				ifTrue: [ self italicName ]
				ifFalse: [ self classicName ] ]
]

{ #category : #accessing }
PDFFont >> fontSize [
	^ fontSize ifNil: [ fontSize := 8 ]
]

{ #category : #accessing }
PDFFont >> fontSize: anObject [
	fontSize := anObject
]

{ #category : #action }
PDFFont >> getCharWidthOf: aChar [
	"If the char is not a ascii char, the method return a default width"

	aChar asInteger > 255
		ifTrue: [ ^ 0 ]
		ifFalse: [ ^ self charWidths at: aChar ]
]

{ #category : #action }
PDFFont >> getIdealFontSizeForTheString: aString width: aWidth into: aDocument [
	"answer the ideal font size for the specified width. The size of the font is not modified"

	| fsize width originalFontSize |
	fsize := 0.
	width := 0.
	
	originalFontSize := self fontSize.
	[ width >=  aWidth ] whileFalse: [
		fsize := fsize + 1. 
		self fontSize: fsize.
		width := self getStringWidth: aString into: aDocument.
	].
	self fontSize: originalFontSize.
	^(fsize - 1)
	
	
]

{ #category : #action }
PDFFont >> getStringWidth: aString into: aDocument [
	"answer the width of the string with the specified font in the user unit"
	
	| width |
	
	width := 0.
	aString do: [ :char | width := width + (self getCharWidthOf: char) ].
	^(width * ((self fontSize  / aDocument scaleFactor) / 1000)) roundDownTo: 0.001	
	

]

{ #category : #accessing }
PDFFont >> italic [
	^ italic ifNil: [ italic := false ]
]

{ #category : #accessing }
PDFFont >> italic: anObject [
	italic := anObject
]

{ #category : #name }
PDFFont >> italicName [
	^ self subclassResponsibility 
]

{ #category : #widths }
PDFFont >> italicWidths [
	^ self subclassResponsibility
]

{ #category : #accessing }
PDFFont >> pdfDocument [
	^ pdfDocument
]

{ #category : #accessing }
PDFFont >> pdfDocument: anObject [
	pdfDocument := anObject
]

{ #category : #accessing }
PDFFont >> scaledFontSize: aScaleFactor [
	^ ((self fontSize / aScaleFactor) roundDownTo: 0.01)
]
