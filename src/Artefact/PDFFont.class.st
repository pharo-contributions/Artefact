"
A PDFFont is the abstract class that inherits all usable fonts for creating PDF.

Instance Variables
	bold:		<Object>
	fontSize:		<Object>
	italic:		<Object>
	pdfDocument:		<Object>

bold
	- xxxxx

fontSize
	- xxxxx

italic
	- xxxxx

pdfDocument
	- xxxxx

"
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
	^ fontSize ifNil: [ fontSize := 8 pt ]
]

{ #category : #accessing }
PDFFont >> fontSize: anObject [
	fontSize := anObject
]

{ #category : #accessing }
PDFFont >> fontSizeAsPoints [
	^ (self fontSize convertTo: Unit points) value 
]

{ #category : #action }
PDFFont >> getCharWidthOf: aChar [
	"If the char is not a ascii char, the method return a default width"

	aChar asInteger > 255
		ifTrue: [ ^ 0 pt ]
		ifFalse: [ ^ (self charWidths at: aChar asInteger + 1) / 1000 * self fontSize ]
]

{ #category : #action }
PDFFont >> getIdealFontSizeForTheString: aString width: aWidth into: aDocument [
	"answer the ideal font size for the specified width. The size of the font is not modified"
	
	| fsize width originalFontSize |
	self flag: 'to adapt'.

	fsize := 0.
	width := 0.
	
	originalFontSize := self fontSize.
	[ width >=  aWidth ] whileFalse: [
		fsize := fsize + 1. 
		self fontSize: fsize.
		width := self getStringWidth: aString.
	].
	self fontSize: originalFontSize.
	^(fsize - 1)
	
	
]

{ #category : #action }
PDFFont >> getStringWidth: aString [
	"answer the width of the string using this font"
	
	^ aString inject: 0 pt 
		into: [:sum :char | sum + (self getCharWidthOf: char)]
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
