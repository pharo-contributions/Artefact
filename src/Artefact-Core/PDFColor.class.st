"
A PDFColor represent a color or a grey level in PDF.

Instance Variables
	blue:		<Object>
	green:		<Object>
	greyLevel:		<Object>
	red:		<Object>

blue
	- xxxxx

green
	- xxxxx

greyLevel
	- xxxxx

red
	- xxxxx

"
Class {
	#name : #PDFColor,
	#superclass : #Object,
	#instVars : [
		'red',
		'green',
		'blue',
		'greyLevel'
	],
	#category : #'Artefact-Core-Base'
}

{ #category : #utilities }
PDFColor class >> formatRGB: aColor [
	"Answer a formated RBG color. The values are rounded"

	^(PDFColor round: aColor red) ,  ' ' , (PDFColor round: aColor green) , ' ' , (PDFColor round: aColor blue)
]

{ #category : #'instance creation' }
PDFColor class >> greyLevel: aGreyLevel [
	^ self new setGreyLevel: aGreyLevel
]

{ #category : #'instance creation' }
PDFColor class >> r:  r g: g b: b [
	^ self new r:  r g: g b: b
]

{ #category : #rounding }
PDFColor class >> round: aValue [
	"answer a rounded value for an color value"

	^((aValue / 255) roundDownTo: 0.001) asString
]

{ #category : #comparing }
PDFColor >> = anotherPDFColor [

	^ #(#blue #red #green #greyLevel)
		allSatisfy: [ :selector | (self perform: selector) = (anotherPDFColor perform: selector) ]
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

{ #category : #testing }
PDFColor >> isEmpty [
	"Answer true if the color is undefined"

	^ self red isNil and: [ self greyLevel isNil ]
]

{ #category : #printing }
PDFColor >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: self value
]

{ #category : #action }
PDFColor >> r:  r g: g b: b [

	self red: r.
	self green: g.
	self blue: b.
	self greyLevel: nil
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
PDFColor >> setGreyLevel: aGreyLevel [

	self greyLevel: aGreyLevel.

	self red: nil.
	self green: nil.
	self blue: nil
]

{ #category : #evaluating }
PDFColor >> value [
	"Answer the value of the color (a RGB tuple or a grey level)"

	self isEmpty
		ifTrue: [ ^ nil ]
		ifFalse: [
			self red
				ifNil: [ ^ self greyLevel asString ]
				ifNotNil: [ ^ self red asString , '.' , self green asString , '.' , self blue asString ] ]
]
