Class {
	#name : #PDFFontStyle,
	#superclass : #PDFStyle,
	#instVars : [
		'family',
		'bold',
		'italic',
		'fontSize'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFFontStyle >> bold [
	^ bold
]

{ #category : #accessing }
PDFFontStyle >> bold: anObject [
	bold := anObject
]

{ #category : #accessing }
PDFFontStyle >> family [
	^ family
]

{ #category : #accessing }
PDFFontStyle >> family: anObject [
	family := anObject
]

{ #category : #accessing }
PDFFontStyle >> fontSize [
	^ fontSize
]

{ #category : #accessing }
PDFFontStyle >> fontSize: anObject [
	fontSize := anObject
]

{ #category : #accessing }
PDFFontStyle >> italic [
	^ italic
]

{ #category : #accessing }
PDFFontStyle >> italic: anObject [
	italic := anObject
]

{ #category : #render }
PDFFontStyle >> render [
	^''
]
