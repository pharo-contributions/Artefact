Class {
	#name : #PDFFont,
	#superclass : #Object,
	#instVars : [
		'bold',
		'italic',
		'fontName',
		'fontSize',
		'charWidths',
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

{ #category : #widths }
PDFFont >> charWidths [
	"Answer a collection of the width of each caracter"
	
	self subclassResponsibility
]

{ #category : #accessing }
PDFFont >> charWidths: anObject [
	charWidths := anObject
]

{ #category : #accessing }
PDFFont >> family [
	"Answer the family name of the font"
	self subclassResponsibility
]

{ #category : #accessing }
PDFFont >> fontName [
	^fontName ifNil: [ fontName := self getFontName ]
]

{ #category : #accessing }
PDFFont >> fontName: anObject [
	fontName := anObject
]

{ #category : #accessing }
PDFFont >> fontSize [
	^ fontSize ifNil: [ fontSize := 12 ]
]

{ #category : #accessing }
PDFFont >> fontSize: anObject [
	fontSize := anObject
]

{ #category : #private }
PDFFont >> getFontName [
	"answer the PDF name of the font"
	
	| style |

	style := String new.
	(self bold) ifTrue: [ style := style , 'B' ].
	(self italic) ifTrue: [ style := style , 'I' ].
	
	^(self family , style)
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
	"answer the width of the string with the specified font"
	
	| width |
	
	width := 0.
	aString do: [ :char | width := width + ((self charWidths at: (self getFontName)) at: char) ].
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

{ #category : #accessing }
PDFFont >> pdfDocument [
	^ pdfDocument
]

{ #category : #accessing }
PDFFont >> pdfDocument: anObject [
	pdfDocument := anObject
]

{ #category : #private }
PDFFont >> setCharWidths: aWidthsCollection [
	"answer a dictionnay that contains the size of each char"
	
	| widths |
	widths := Dictionary new.
	
	1 to: 255 do: [ :i | widths at: (Character value: (i - 1))  put: (aWidthsCollection at: i) ].
	^widths
]
