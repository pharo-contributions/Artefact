Class {
	#name : #PDFFontStyle,
	#superclass : #PDFStyle,
	#instVars : [
		'family',
		'bold',
		'italic',
		'fontSize',
		'fontName'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFFontStyle >> bold [
	^ bold ifNil: [ bold := false ]
]

{ #category : #accessing }
PDFFontStyle >> bold: anObject [
	bold := anObject
]

{ #category : #accessing }
PDFFontStyle >> family [
	^ family ifNil: [ family := 'helvetica' ]
]

{ #category : #accessing }
PDFFontStyle >> family: anObject [
	family := anObject asLowercase.
	(family = 'arial') ifTrue: [ family := 'helvetica' ] 

]

{ #category : #accessing }
PDFFontStyle >> fontName [
	^fontName ifNil: [ fontName := self getFontName ]
]

{ #category : #accessing }
PDFFontStyle >> fontName: anObject [
	fontName := anObject
]

{ #category : #accessing }
PDFFontStyle >> fontSize [
	^ fontSize ifNil: [ fontSize := 12]
]

{ #category : #accessing }
PDFFontStyle >> fontSize: anObject [
	fontSize := anObject
]

{ #category : #action }
PDFFontStyle >> getFontName [
	"answer the PDF name of the font"
	
	| style |

	style := String new.
	(self bold) ifTrue: [ style := style , 'B' ].
	(self italic) ifTrue: [ style := style , 'I' ].
	
	^(self family , style)

]

{ #category : #accessing }
PDFFontStyle >> italic [
	^ italic ifNil: [ italic := false ]
]

{ #category : #accessing }
PDFFontStyle >> italic: anObject [
	italic := anObject
]

{ #category : #render }
PDFFontStyle >> render: aDocument [
	| size |

	size := (self fontSize / aDocument scaleFactor) roundDownTo: 0.01.	
	
	aDocument fonts at: (self fontName) ifAbsent: [ aDocument fonts at: self fontName put: ((aDocument fonts size) + 1) ].
 
	^ ('BT /F', (aDocument fonts at: (self fontName)) asString , ' ' , (size asString) , ' Tf ET')
	

]
