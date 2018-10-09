"
A PDFGenerator has the responsibility to transform a PDFDocument and all the PDFElement inside into many PDFDataType.

Instance Variables

"
Class {
	#name : #PDFGenerator,
	#superclass : #Object,
	#instVars : [
		'currentObjectNumber',
		'document',
		'usedFonts',
		'xref',
		'currentPage',
		'currentFontId',
		'usedImages',
		'currentImageId',
		'currentOpacityId',
		'usedOpacities',
		'compression',
		'firstPage',
		'displayLayout',
		'displayMode',
		'zoom'
	],
	#category : #'Artefact-Core-Generator'
}

{ #category : #accessing }
PDFGenerator >> compression [
	^compression
]

{ #category : #accessing }
PDFGenerator >> compression: aBoolean [
	compression := aBoolean
]

{ #category : #conversion }
PDFGenerator >> convertToPoints: aUnitValue [ 
	^ (aUnitValue convertTo: #points) value
	
]

{ #category : #font }
PDFGenerator >> createFontObject: aFontName [
	| fontObject |
	fontObject := self createNewPDFDataObject.
	fontObject
		addContent:
			(PDFDataAssociativeArray new
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'Font'));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Subtype') value: (PDFDataSymbol symbol: 'Type1'));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'BaseFont') value: (PDFDataSymbol symbol: aFontName));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Encoding') value: (PDFDataSymbol symbol: 'WinAnsiEncoding'));
				yourself).
	^ fontObject
]

{ #category : #image }
PDFGenerator >> createImageObject: anImageStream [
	| imageObject imageStream readWriter |
	self flag: 'Only works with JPEG'.
	imageObject := self createNewPDFDataObject.
	readWriter := (JPEGReadWriter on: anImageStream) nextImage; yourself.
	imageStream := PDFDataXObjectStream stream: anImageStream.
	imageObject
		addContent:
			(PDFDataAssociativeArray new
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'XObject'));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Subtype') value: (PDFDataSymbol symbol: 'Image'));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Width') value: (PDFDataValue value: readWriter width));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Height') value: (PDFDataValue value: readWriter height));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'ColorSpace') value: (PDFDataSymbol symbol: 'DeviceRGB'));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Filter') value: (PDFDataSymbol symbol: 'DCTDecode'));
				add:
						(PDFDataCouple key: (PDFDataSymbol symbol: 'BitsPerComponent') value: (PDFDataValue value: readWriter dataPrecision));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Length') value: (PDFDataValue value: imageStream stream size));
				yourself);
		addContent: imageStream.
	^ imageObject
]

{ #category : #section }
PDFGenerator >> createMetaDataObject: aMetaData [
	| metadataObject |
	metadataObject := self createNewPDFDataObject.
	
	metadataObject
		addContent:
			(PDFDataAssociativeArray new
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Producer') value: (PDFDataString text: (aMetaData producer)));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Title') value: (PDFDataString text: (aMetaData title)));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Subject') value: (PDFDataString text: (aMetaData subject)));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Author') value: (PDFDataString text: (aMetaData author)));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Keywords') value: (PDFDataString text: (aMetaData keywords)));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Creator') value: (PDFDataString text: (aMetaData creator)));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'CreationDate') value: (PDFDataDateAndTime date: (Date today) time: (Time now)));
				yourself).
	^ metadataObject
]

{ #category : #action }
PDFGenerator >> createNewPDFDataObject [
	| object |
	currentObjectNumber := currentObjectNumber + 1.
	object := PDFDataObject new
		id: currentObjectNumber;
		revision: 0;
		yourself.
	xref AddReferenceTo: object.
	^ object
]

{ #category : #opacity }
PDFGenerator >> createOpacityObject: aOpacityObject [
	| opacityObject |
	opacityObject := self createNewPDFDataObject.
	opacityObject
		addContent:
			(PDFDataAssociativeArray new
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'ExtGState'));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'ca ') value: (PDFDataValue value: aOpacityObject alpha));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'CA') value: (PDFDataValue value: aOpacityObject alpha));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'BM') value: (PDFDataSymbol symbol: (aOpacityObject blendMode)));
				yourself).
	^ opacityObject
]

{ #category : #action }
PDFGenerator >> createPDFDataStreamFrom: aPage [
	^ PDFDataStream
		codeSegment:
			(PDFCompositeCodeSegment
				from:
					(aPage elements collect: [ :anElement | anElement generateWith: self styleSheet: aPage styleSheet format: aPage format ])
				styleSheet: aPage styleSheet)
]

{ #category : #section }
PDFGenerator >> createRootObject [
	| rootObject content |
	rootObject := self createNewPDFDataObject.
	content := PDFDataAssociativeArray new 
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'Catalog'));
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Pages') value: (PDFDataReference reference: document)).
		
		(self zoom ~= nil)
			ifTrue: [  
				"We use the zoom value" 
				content add: (self generateZoom).
			]
			ifFalse: [  
				"we use the selected display mode"
				(self displayMode ~= #defaultDisplayMode) ifTrue: [ content add: (self generateDisplayMode) ]
			].	
		"add: (PDFDataCouple key: (PDFDataSymbol symbol: 'OpenAction') value: (PDFDataArray from: { 
			(PDFDataReference reference: self firstPage).
			(PDFDataSymbol symbol: 'Fit')
		}));"
				
		 (self displayLayout ~= #defaultDisplayLayout) ifTrue: [ 
			content add: (PDFDataCouple key: (PDFDataSymbol symbol: 'PageLayout') value: (self generateDisplayLayout)).
		].
			
	^ rootObject addContent: content.
	
]

{ #category : #accessing }
PDFGenerator >> currentPage [
	^ currentPage
]

{ #category : #accessing }
PDFGenerator >> currentPage: anObject [
	currentPage := anObject
]

{ #category : #conversion }
PDFGenerator >> determinePositionOnCurrentPage: aPosition [ 
	^ (self convertToPoints: (aPosition x)) @ (self convertToPoints: (self currentPage format size y - aPosition y) )
]

{ #category : #accessing }
PDFGenerator >> displayLayout [
	^displayLayout 
]

{ #category : #accessing }
PDFGenerator >> displayLayout: aSymbol [
	displayLayout :=  aSymbol
]

{ #category : #accessing }
PDFGenerator >> displayMode [
	^displayMode
]

{ #category : #accessing }
PDFGenerator >> displayMode: aSymbol [
	displayMode :=  aSymbol
]

{ #category : #accessing }
PDFGenerator >> firstPage [
	^firstPage
]

{ #category : #accessing }
PDFGenerator >> firstPage: anObject [
	firstPage := anObject
]

{ #category : #action }
PDFGenerator >> generateContentsFor: aPage [
	| contents associativeArray stream lengthObject |
	contents := self createNewPDFDataObject.
	associativeArray := PDFDataAssociativeArray new.
	stream := self createPDFDataStreamFrom: aPage.	

	lengthObject := self createNewPDFDataObject.
	lengthObject addContent: (PDFDataStreamRefSize stream: stream).
	
	associativeArray
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Length') value: (PDFDataReference reference: lengthObject)).
	
	"compression support ?"	
	(self compression) ifTrue: [ 
		associativeArray
			add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Filter') value: (PDFDataSymbol symbol: 'FlateDecode')).	
		 ].
		
	contents
		addContent: associativeArray;
		addContent: stream.
	^ contents
]

{ #category : #action }
PDFGenerator >> generateDisplayLayout [
	"Answer the PDF symbol for the selected display layout"
	
	^PDFDataSymbol symbol: ({ #singlePage->'SinglePage' . #continuousPages->'OneColumn' . #twoPages->'TwoColumnLeft' } asDictionary at: self displayLayout).

]

{ #category : #action }
PDFGenerator >> generateDisplayMode [
	| value |
	value := PDFDataArray from:  { (PDFDataReference reference: self firstPage) }.
	
	(self displayMode = #fullPage)
		ifTrue: [  value addElement: (PDFDataSymbol symbol: 'Fit') ]
		ifFalse: [ 
			(self displayMode = #fullWidth)
				ifTrue: [  value addElement: (PDFDataSymbol symbol: 'FitH'); addElement: (PDFDataValue value: 'null'); yourself ]
				ifFalse: [ 
					(self displayMode = #real)
						ifTrue: [  
							value addElement: (PDFDataSymbol symbol: 'XYZ'); 
								addElement: (PDFDataValue value: 'null'); 
								addElement: (PDFDataValue value: 'null'); 
								addElement: (PDFDataValue value: 1); 
								yourself.
						]
				]
		 ].
	
	^PDFDataCouple key: (PDFDataSymbol symbol: 'OpenAction') value: value.
]

{ #category : #font }
PDFGenerator >> generateFontId [
	currentFontId := currentFontId + 1.
	^ 'F' , currentFontId asString
]

{ #category : #image }
PDFGenerator >> generateImageId [
	currentImageId := currentImageId + 1.
	^ 'I' , currentImageId asString
]

{ #category : #font }
PDFGenerator >> generateListOfFonts [
	| fonts |
	fonts := PDFDataAssociativeArray new.
	usedFonts
		keysAndValuesDo: [ :aFontName :aFontId | 
			fonts
				add:
					(PDFDataCouple
						key: (PDFDataSymbol symbol: (aFontId asString))
						value: (PDFDataReference reference: (self createFontObject: aFontName))) ].
	^ fonts
]

{ #category : #image }
PDFGenerator >> generateListOfImages [
	| images |
	images := PDFDataAssociativeArray new.
	usedImages
		keysAndValuesDo: [ :anImageStream :anImageId | 
			images
				add:
					(PDFDataCouple
						key: (PDFDataSymbol symbol: (anImageId asString))
						value: (PDFDataReference reference: (self createImageObject: anImageStream))) ].
	^ images
]

{ #category : #opacity }
PDFGenerator >> generateListOfOpacities [
	| opacities |
	
	opacities := PDFDataAssociativeArray new.
	
	usedOpacities
		keysAndValuesDo: [ :aOpacityObject :aOpacityId | 
			opacities
				add:
					(PDFDataCouple
						key: (PDFDataSymbol symbol: (aOpacityId asString))
						value: (PDFDataReference reference: (self createOpacityObject: aOpacityObject))) ].
	^ opacities
]

{ #category : #opacity }
PDFGenerator >> generateOpacityId [
	currentOpacityId := currentOpacityId + 1.
	^ 'GS' , currentOpacityId asString
]

{ #category : #action }
PDFGenerator >> generatePDFCompleteModelFrom: aPDFDocument [
	
	self compression: aPDFDocument compression.
	self displayLayout: aPDFDocument displayLayout.
	self displayMode: aPDFDocument displayMode.
	self zoom: aPDFDocument zoom.
	
	document := self generatePDFDocument: aPDFDocument.
	
	^ PDFDataTrailer new
		addContent:
				(PDFDataAssociativeArray new
						add:
								(PDFDataCouple key: (PDFDataSymbol symbol: 'Root') value: (PDFDataReference reference: self createRootObject));
						add:
								(PDFDataCouple
										key: (PDFDataSymbol symbol: 'Info')
										value: (PDFDataReference reference: (self createMetaDataObject: aPDFDocument metaData)));
						add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Size') value: (PDFDataValue value: currentObjectNumber + 1)));
		addContent: (PDFDataStartXref to: xref)
]

{ #category : #action }
PDFGenerator >> generatePDFDocument: aPDFDocument [
	"should receive a PDFDocument and return a PDFDataObject representing the document"
	
	| associativeArray references resources |
	
	document := self createNewPDFDataObject.
	associativeArray := PDFDataAssociativeArray new.
	associativeArray add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'Pages')).
	"Generate Pages"
	references := aPDFDocument pages collect: [ :aPage | PDFDataReference reference: (self generatePDFPage: aPage) ].
	associativeArray add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Kids') value: (PDFDataArray from: references)).
	associativeArray add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Count') value: (PDFDataValue value: references size)).
	associativeArray add: (self generatePDFFormat: aPDFDocument format).
	resources := PDFDataAssociativeArray new.
	resources
		add:
				(PDFDataCouple
						key: (PDFDataSymbol symbol: 'ProcSet')
						value:
							(PDFDataArray
								from:
									{(PDFDataSymbol symbol: 'PDF').
									(PDFDataSymbol symbol: 'Text').
									(PDFDataSymbol symbol: 'ImageC')}));
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Font') value: self generateListOfFonts);
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'XObject') value: self generateListOfImages);
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'ExtGState') value: self generateListOfOpacities).
	associativeArray add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Resources') value: resources).
	document addContent: associativeArray.
	
	^ document
]

{ #category : #section }
PDFGenerator >> generatePDFFormat: aPDFFormat [
	^ PDFDataCouple new
		key: (PDFDataSymbol symbol: 'MediaBox');
		value:
				(PDFDataArray
						from:
							{(PDFDataValue value: 0).
							(PDFDataValue value: 0).
							(PDFDataValue value: (aPDFFormat width convertTo: Unit points) value).
							(PDFDataValue value: (aPDFFormat height convertTo: Unit points) value)})
]

{ #category : #action }
PDFGenerator >> generatePDFPage: aPDFPage [
	| page associativeArray |
	currentPage := aPDFPage.
	page := self createNewPDFDataObject.
	(self firstPage = nil) ifTrue: [ self firstPage: page ].

	associativeArray := PDFDataAssociativeArray
		new
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'Page'));
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Parent') value: (PDFDataReference reference: document));
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Group') value: (PDFDataAssociativeArray new 
			add: (PDFDataSymbol symbol: 'Type');
			add: (PDFDataSymbol symbol: 'Group');
			add: (PDFDataSymbol symbol: 'S');
			add: (PDFDataSymbol symbol: 'Transparency');
			add: (PDFDataSymbol symbol: 'CS');
			add: (PDFDataSymbol symbol: 'DeviceRGB')
		));
		add: (self generatePDFFormat: (aPDFPage format ifNil: [ aPDFPage document format ]));
		add:
				(PDFDataCouple
						key: (PDFDataSymbol symbol: 'Contents')
						value: (PDFDataReference reference: (self generateContentsFor: aPDFPage)));
		yourself.
	page addContent: associativeArray.
	^ page
	


]

{ #category : #section }
PDFGenerator >> generatePDFVersion: aPDFVersion [
	^ PDFDataComment new comment: ('PDF-' , aPDFVersion).
		
]

{ #category : #action }
PDFGenerator >> generateZoom [
	"answer the PDF code to set the user's zoom"
	^PDFDataCouple key: (PDFDataSymbol symbol: 'OpenAction') value: (PDFDataArray from:  { 
		(PDFDataReference reference: self firstPage).
		(PDFDataSymbol symbol: 'XYZ').
		(PDFDataValue value: 'null').
		(PDFDataValue value: 'null').
		(PDFDataValue value: ((self zoom / 100) asFloat))
	 })
]

{ #category : #font }
PDFGenerator >> getFontIdFor: aPDFFont [
	^ usedFonts at: aPDFFont fontName ifAbsentPut: [ self generateFontId ]
]

{ #category : #image }
PDFGenerator >> getImageIdFor: aPDFImage [
	^ usedImages at: (aPDFImage stream) ifAbsentPut: [ self generateImageId ]
]

{ #category : #opacity }
PDFGenerator >> getOpacityIdFor: aOpacityObject [

	^ usedOpacities at: aOpacityObject ifAbsentPut: [ self generateOpacityId ]
	
]

{ #category : #'initialize-release' }
PDFGenerator >> initialize [
	firstPage := nil.
	currentObjectNumber := 0.
	currentFontId := 0.
	currentImageId := 0.
	currentOpacityId := 0.
	usedFonts := Dictionary new.
	usedImages := Dictionary new.
	usedOpacities := Dictionary new.
	xref := PDFDataXRef new
]

{ #category : #'as yet unclassified' }
PDFGenerator >> splitPages: aCollectionOfPages [
	^ self
		inject: OrderedCollection new
		into: [ :result :aPage | 
			aPage extensible
				ifTrue: [ result addAll: (self splitPage: aPage) ]
				ifFalse: [ result add: aPage ] ]
]

{ #category : #accessing }
PDFGenerator >> zoom [
	^zoom
]

{ #category : #accessing }
PDFGenerator >> zoom: anInteger [
	zoom := anInteger
]
