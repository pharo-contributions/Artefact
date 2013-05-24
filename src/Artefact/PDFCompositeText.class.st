"
A PDFCompositeText is the superclass for each text.

Instance Variables
	alignment:		<Object>
	margin:		<Object>
	text:		<Object>
	verticalAlignment:		<Object>

alignment
	- xxxxx

margin
	- xxxxx

text
	- xxxxx

verticalAlignment
	- xxxxx

"
Class {
	#name : #PDFCompositeText,
	#superclass : #PDFComposite,
	#instVars : [
		'text'
	],
	#category : #'Artefact-Elements-Composites'
}

{ #category : #private }
PDFCompositeText >> alignment: aPDFAlignment [
	self styleSheet alignment: aPDFAlignment
]

{ #category : #accessing }
PDFCompositeText >> margin: aMargin [
	self styleSheet margin: aMargin
]

{ #category : #render }
PDFCompositeText >> minimumDimensionWith: aPDFGenerator styleSheet: aStyleSheet [
	^ self dimension
		ifNil: [ ((aStyleSheet font getStringWidth: self text) + (2 * aStyleSheet margin)) @ (aStyleSheet font fontSize + (2 * aStyleSheet margin)) ]
	
]

{ #category : #accessing }
PDFCompositeText >> text [
	^text
]

{ #category : #accessing }
PDFCompositeText >> text: aString [
	text := aString
]
