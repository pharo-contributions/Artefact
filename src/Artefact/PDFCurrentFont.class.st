"
PDFCurrentFont containt the current font used in the document.

Instance Variables:
	fontFamily	<ProtoObject | PseudoContext>
	fontStyle	<ProtoObject | PseudoContext>
	fontSize	<ProtoObject | PseudoContext>
	fontSizePt	<ProtoObject | PseudoContext>
"
Class {
	#name : #PDFCurrentFont,
	#superclass : #Object,
	#instVars : [
		'fontFamily',
		'fontSize',
		'fontSizePt',
		'bold',
		'italic'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFCurrentFont >> bold [
	^ bold
]

{ #category : #accessing }
PDFCurrentFont >> bold: aLogicValue [
	bold := aLogicValue
]

{ #category : #accessing }
PDFCurrentFont >> fontFamily [
	^ fontFamily
]

{ #category : #accessing }
PDFCurrentFont >> fontFamily: anObject [
	fontFamily := anObject
]

{ #category : #accessing }
PDFCurrentFont >> fontSize [
	^ fontSize
]

{ #category : #accessing }
PDFCurrentFont >> fontSize: anObject [
	fontSize := anObject
]

{ #category : #accessing }
PDFCurrentFont >> fontSizePt [
	^ fontSizePt
]

{ #category : #accessing }
PDFCurrentFont >> fontSizePt: anObject [
	fontSizePt := anObject
]

{ #category : #accessing }
PDFCurrentFont >> italic [
	^ italic
]

{ #category : #accessing }
PDFCurrentFont >> italic: anObject [
	italic := anObject
]
