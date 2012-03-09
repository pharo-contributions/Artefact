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
	^ fillColor ifNil: [ fillColor := PDFColor new setColor: #(255 255 255) ]
]

{ #category : #accessing }
PDFStyle >> fillColor: aPDFColor [
	fillColor := aPDFColor
]

{ #category : #private }
PDFStyle >> formatColor: aColor [
	^(PDFColor round: aColor red) ,  ' ' , (PDFColor round: aColor green) , ' ' , (PDFColor round: aColor blue)
]

{ #category : #render }
PDFStyle >> initStyle: aDocument [
	self subclassResponsibility 
]

{ #category : #'initialize-release' }
PDFStyle >> initialize [ 
	super initialize.
	self buffer: OrderedCollection new.
	
]

{ #category : #accessing }
PDFStyle >> ink [
	^ink ifNil: [ ink := PDFColor new setColor: #(0 0 0) ]
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
PDFStyle >> renderContentOn: aPage of: aDocument [
	self subclassResponsibility
]

{ #category : #render }
PDFStyle >> renderIn: aPage of: aDocument [
	"initialize the style and answer the style content. The style receive the document context and the current page"
	
	self initStyle: aDocument.
	^(self renderContentOn: aPage of: aDocument)
]

{ #category : #render }
PDFStyle >> setColorForInk: aInkPDFColor fillWith: aFillPDFColor [
	"answer the PDF instruction to set the colors or grey level for ink and fillColor"
	
	|  pdfcode |
	
	pdfcode := OrderedCollection new.
	
	"ink to write text or draw"
	(aInkPDFColor greyLevel isNil) 
		ifTrue: [ (aInkPDFColor red isNil) ifFalse: [ pdfcode add: ((PDFColor formatRGB: aInkPDFColor) , ' RG') ] ]
		ifFalse: [ pdfcode add: (PDFColor round: (aInkPDFColor greyLevel)) , ' G' ].
	"fill color"
	(aFillPDFColor greyLevel isNil)
		ifTrue: [ (aFillPDFColor red isNil) ifFalse: [ pdfcode add: ((PDFColor formatRGB: aFillPDFColor) , ' rg') ] ]
		ifFalse: [ pdfcode add: (PDFColor round: (aFillPDFColor greyLevel)) , ' g' ].
		
	^pdfcode

]
