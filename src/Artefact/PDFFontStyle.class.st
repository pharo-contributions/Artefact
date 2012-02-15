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
	family := anObject
]

{ #category : #accessing }
PDFFontStyle >> fontSize [
	^ fontSize ifNil: [ fontSize := 12]
]

{ #category : #accessing }
PDFFontStyle >> fontSize: anObject [
	fontSize := anObject
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
PDFFontStyle >> render [
	^''
]
