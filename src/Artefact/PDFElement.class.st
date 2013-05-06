"
A PDFElement is the abstract class for each element that can be included in a PDFPage.

Each PDFElement have the possibility to define which style will be applyed on it instead of the default one.

Instance Variables
	styleSheet:		<Object>

styleSheet
	- xxxxx

"
Class {
	#name : #PDFElement,
	#superclass : #Object,
	#instVars : [
		'styleSheet',
		'wh',
		'from',
		'style'
	],
	#category : #'Artefact-Elements'
}

{ #category : #style }
PDFElement >> buildCompositeStyleSheetFrom: aStyleSheet [
	"realise the addition (ordered from less priority to higher) of differents styleSheet. The first one come from the upper elements. The second one is the context specific to the element. The third one is defined by the user only for this element and so is prioritary"

	^ (aStyleSheet substyles
		at: self style
		ifPresent: [ :subStyle | aStyleSheet withoutSubstyles + subStyle ]
		ifAbsent: [ aStyleSheet ]) + self styleSheet
]

{ #category : #style }
PDFElement >> defaultStyle [
	^ self subclassResponsibility 
]

{ #category : #accessing }
PDFElement >> from [
	^ from
]

{ #category : #accessing }
PDFElement >> from: anObject [
	from := anObject
]

{ #category : #render }
PDFElement >> generateCodeSegmentWith: aGenerator styleSheet: aStyleSheet [
	^ self subclassResponsibility 
]

{ #category : #'initialize-release' }
PDFElement >> initialize [ 
	super initialize.

	self styleSheet: PDFStyleSheet new.
	self style: self defaultStyle
]

{ #category : #render }
PDFElement >> minimumDimensionWith: aPDFGenerator styleSheet: aStyleSheet [
	"Return the minimum wh for layout, by default its the one defined by the user"
	^ self wh
]

{ #category : #accessing }
PDFElement >> rotation: anAngle [
	self styleSheet rotation: anAngle 
 
]

{ #category : #accessing }
PDFElement >> style [
	^ style
]

{ #category : #accessing }
PDFElement >> style: anObject [
	style := anObject
]

{ #category : #accessing }
PDFElement >> styleSheet [
	^ styleSheet
]

{ #category : #accessing }
PDFElement >> styleSheet: anObject [
	styleSheet := anObject
]

{ #category : #accessing }
PDFElement >> wh [
	^ wh
]

{ #category : #accessing }
PDFElement >> wh: anObject [
	wh := anObject
]
