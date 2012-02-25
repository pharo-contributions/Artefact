Class {
	#name : #PDFStyle,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'ink',
		'fillColor'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFStyle >> buffer [
	^ buffer
]

{ #category : #accessing }
PDFStyle >> buffer: anObject [
	buffer := anObject
]

{ #category : #accessing }
PDFStyle >> fillColor [
	^ fillColor ifNil: [ fillColor := PDFColor new setColor: #(255 0 0); setGreyLevel: nil ]
]

{ #category : #accessing }
PDFStyle >> fillColor: aPDFColor [
	fillColor := aPDFColor
]

{ #category : #private }
PDFStyle >> formatColor: aColor [
	^(self roundColor: aColor red) ,  ' ' , (self roundColor: aColor green) , ' ' , (self roundColor: aColor blue)
]

{ #category : #render }
PDFStyle >> initStyle: aDocument [
	self subclassResponsibility
]

{ #category : #'initialize-release' }
PDFStyle >> initialize [ 
	super initialize.
	self buffer: OrderedCollection new.
	
	"set the default colors"
	self ink: (PDFColor new setColor: #(0 0 0)).
	self fillColor: (PDFColor new).
]

{ #category : #accessing }
PDFStyle >> ink [
	^ ink ifNil: [ ink := PDFColor new setColor: #(0 0 0); setGreyLevel: nil ]
]

{ #category : #accessing }
PDFStyle >> ink: aPDFColor [
	ink := aPDFColor
]

{ #category : #private }
PDFStyle >> out: aItem [
	"append the item (or a list of items) to the style"
	
	(aItem className = 'OrderedCollection') 
		ifTrue: [ aItem do: [ :aValue | self buffer add: aValue ] ]
		ifFalse: [ self buffer add: aItem ]
]

{ #category : #render }
PDFStyle >> render: aDocument [
	self subclassResponsibility
]

{ #category : #private }
PDFStyle >> roundColor: aValue [
	^((aValue / 255) roundDownTo: 0.001) asString 
]

{ #category : #render }
PDFStyle >> setColorForInk: aInkPDFColor fillWith: aFillPDFColor [
	"answer the PDF instruction to set the colors or grey level for ink and fillColor"
	
	|  pdfcode |
	
	pdfcode := OrderedCollection new.
	
	"ink to write text or draw"
	(aInkPDFColor greyLevel isNil) 
		ifTrue: [ (aInkPDFColor red isNil) ifFalse: [ pdfcode add: ((self formatColor: aInkPDFColor) , ' RG') ] ]
		ifFalse: [ pdfcode add: (self roundColor: (aInkPDFColor greyLevel)) , ' G' ].
	"fill color"
	(aFillPDFColor greyLevel isNil)
		ifTrue: [ (aFillPDFColor red isNil) ifFalse: [ pdfcode add: ((self formatColor: aFillPDFColor) , ' rg') ] ]
		ifFalse: [ pdfcode add: (self roundColor: (aFillPDFColor greyLevel)) , ' g' ].
	^pdfcode

]
