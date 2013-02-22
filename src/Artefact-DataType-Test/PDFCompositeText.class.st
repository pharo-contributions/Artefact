Class {
	#name : #PDFCompositeText,
	#superclass : #PDFComposite,
	#instVars : [
		'text',
		'alignment',
		'verticalAlignment',
		'margin'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #private }
PDFCompositeText >> alignment [
	^ alignment ifNil: [ alignment := #LEFT ]
]

{ #category : #private }
PDFCompositeText >> alignment: anObject [
	alignment := anObject
]

{ #category : #action }
PDFCompositeText >> bottom [
	self verticalAlignment: #BOTTOM
]

{ #category : #action }
PDFCompositeText >> center [
	self alignment: #CENTER
]

{ #category : #style }
PDFCompositeText >> defaultMargin [
	^0
]

{ #category : #action }
PDFCompositeText >> left [
	self alignment: #LEFT
]

{ #category : #accessing }
PDFCompositeText >> margin [
	^margin ifNil: [ margin := self defaultMargin ]
]

{ #category : #accessing }
PDFCompositeText >> margin: aMargin [
	margin := aMargin
]

{ #category : #action }
PDFCompositeText >> middle [
	self verticalAlignment: #MIDDLE
]

{ #category : #action }
PDFCompositeText >> right [
	self alignment: #RIGHT
]

{ #category : #accessing }
PDFCompositeText >> text [
	^text
]

{ #category : #accessing }
PDFCompositeText >> text: aString [
	text := aString
]

{ #category : #action }
PDFCompositeText >> top [
	self verticalAlignment: #TOP
]

{ #category : #private }
PDFCompositeText >> verticalAlignment [
	^ verticalAlignment ifNil: [ verticalAlignment := self defaultAlignment ]
]

{ #category : #private }
PDFCompositeText >> verticalAlignment: anObject [
	verticalAlignment := anObject
]