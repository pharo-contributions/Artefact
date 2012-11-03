Class {
	#name : #PDFDataTable,
	#superclass : #PDFComposite,
	#instVars : [
		'elements',
		'data'
	],
	#category : #'Artefact-Styles'
}

{ #category : #action }
PDFDataTable >> buildCaption: aString [
	"answer a PDFCellStyle instance for a caption datatable cell"

	|ink captionElement |

	captionElement := PDFCellStyle new 
		styleSheet: (self styleSheet deepCopy); 
		wh: self wh; 
		text: aString.
		
	"textcolor and fillcolor are reversed for the captions"	
	ink := captionElement textColorIfAbsent: (self page styleSheet). 
	captionElement textColor: (captionElement fillColorIfAbsent: (self page styleSheet)).
	captionElement fillColor: ink. 
	
	^captionElement
		
]

{ #category : #action }
PDFDataTable >> buildValue: aValue [
	"answer a PDFCellStyle instance for a value datatable cell"

	^PDFCellStyle new
		styleSheet: (self styleSheet deepCopy);
		wh: (self wh);
		text: (aValue)
]

{ #category : #accessing }
PDFDataTable >> data [
	^data
]

{ #category : #accessing }
PDFDataTable >> data: anArray [
	data := anArray
]

{ #category : #accessing }
PDFDataTable >> dotted: aPDFDottedObject [
	self styleSheet dotted: aPDFDottedObject
]

{ #category : #accessing }
PDFDataTable >> dottedIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #dotted ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFDataTable >> drawColor: aColor [
	self styleSheet drawColor: aColor
]

{ #category : #accessing }
PDFDataTable >> drawColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #drawColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFDataTable >> fillColor: aColor [
	self styleSheet fillColor: aColor
]

{ #category : #accessing }
PDFDataTable >> fillColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #fillColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFDataTable >> font: aFont [
	self styleSheet font: aFont
]

{ #category : #accessing }
PDFDataTable >> fontIfAbsent: aStyleSheet. [
	^ (self styleSheet get: #font ifAbsentFrom: aStyleSheet)
]

{ #category : #'initialize-release' }
PDFDataTable >> initialize [
	super initialize.
	elements := OrderedCollection new.
]

{ #category : #accessing }
PDFDataTable >> textColor: aColor [
	self styleSheet textColor: aColor
]

{ #category : #accessing }
PDFDataTable >> textColorIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #textColor ifAbsentFrom: anAlternativeStyleSheet 
]

{ #category : #accessing }
PDFDataTable >> thickness: aThickness [
	self styleSheet thickness:  aThickness
]

{ #category : #accessing }
PDFDataTable >> thicknessIfAbsent: anAlternativeStyleSheet [
	^ self styleSheet get: #thickness ifAbsentFrom: anAlternativeStyleSheet 
]
