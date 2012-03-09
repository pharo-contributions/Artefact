Class {
	#name : #PDFColor,
	#superclass : #Object,
	#instVars : [
		'red',
		'green',
		'blue',
		'greyLevel'
	],
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFColor class >> round: aValue [
	"answer a rounded value for an color value"
	^((aValue / 255) roundDownTo: 0.001) asString 
]

{ #category : #accessing }
PDFColor >> blue [
	^ blue
]

{ #category : #accessing }
PDFColor >> blue: anObject [
	blue := anObject
]

{ #category : #accessing }
PDFColor >> green [
	^ green
]

{ #category : #accessing }
PDFColor >> green: anObject [
	green := anObject
]

{ #category : #accessing }
PDFColor >> greyLevel [
	^ greyLevel
]

{ #category : #accessing }
PDFColor >> greyLevel: anObject [
	greyLevel := anObject
]

{ #category : #action }
PDFColor >> isEmpty [
	"Answer true if the color is undefined"
	^(self red isNil and: [ self greyLevel isNil ])
]

{ #category : #accessing }
PDFColor >> red [
	^ red
]

{ #category : #accessing }
PDFColor >> red: anObject [
	red := anObject
]

{ #category : #action }
PDFColor >> setColor: aRGBList [
	self red: (aRGBList at: 1).
	self green: (aRGBList at: 2).
	self blue: (aRGBList at: 3).
	
	self greyLevel: nil.

]

{ #category : #action }
PDFColor >> setGreyLevel: aGreyLevel [
	self greyLevel: aGreyLevel.
	
	self red: nil.
	self green: nil.
	self blue: nil.
]

{ #category : #tools }
PDFColor >> value [
	"answer the value of the color (a RGB tuple or a grey level)"
	
	(self isEmpty)
		ifTrue: [ ^nil ] 
		ifFalse: [
			(self red isNil) 
				ifTrue: [ ^ self greyLevel ]
				ifFalse: [ ^ (self red asString) , '.' , (self green asString) , '.' , (self blue asString) ]
		]

]
