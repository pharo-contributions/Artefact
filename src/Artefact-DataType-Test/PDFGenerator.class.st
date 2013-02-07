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
		'usedFonts'
	],
	#category : #'Artefact-Generator'
}

{ #category : #'as yet unclassified' }
PDFGenerator >> createCatalogObject [
	| catalogObject |
	catalogObject := self createNewPDFDataObject.
	catalogObject
		addContent:
			(PDFDataAssociativeArray new
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'Catalog'));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Pages') value: (PDFDataReference reference: self document));
				yourself).
	^ catalogObject
]

{ #category : #'as yet unclassified' }
PDFGenerator >> createFontObject: aFont [
	| fontObject |
	fontObject := self createNewPDFDataObject.
	fontObject
		addContent:
			(PDFDataAssociativeArray new
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'Font'));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'SubType') value: (PDFDataSymbol symbol: 'Type1'));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'BaseFont') value: (PDFDataSymbol symbol: aFont));
				add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Encoding') value: (PDFDataSymbol symbol: 'WinAnsiEncoding'));
				yourself).
	^ fontObject
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
PDFGenerator >> createNewPDFDataObject [
	currentObjectNumber := currentObjectNumber + 1.
	^ PDFDataObject new
		id: currentObjectNumber;
		revision: 0;
		yourself
]

{ #category : #'as yet unclassified' }
PDFGenerator >> createPDFDataStreamFrom: aPage [
	^ PDFDataStream
		codeSegments:
			(aPage elements inject: {} into: [ :str :anElement | str , (anElement generateCodeSegmentArrayIn: aPage) ])
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generateContents: aPage [
	| contents associativeArray stream lengthObject |
	contents := self createNewPDFDataObject.
	associativeArray := PDFDataAssociativeArray new.
	stream := self createPDFDataStreamFrom: aPage.
	lengthObject := self createNewPDFDataObject.
	lengthObject addContent: (PDFDataStreamRefSize stream: stream).
	associativeArray
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Length') value: (PDFDataReference reference: lengthObject)).
	contents
		addContent: associativeArray;
		addContent: stream.
	^ contents
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generateContentsFor: aPage [
	| contents associativeArray stream lengthObject |
	contents := self createNewPDFDataObject.
	associativeArray := PDFDataAssociativeArray new.
	stream := self createPDFDataStreamFrom: aPage.
	
	self registerFontsForCodeSegments: stream codeSegments.
	
	lengthObject := self createNewPDFDataObject.
	lengthObject addContent: (PDFDataStreamRefSize stream: stream).
	associativeArray
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Length') value: (PDFDataReference reference: lengthObject)).
	contents
		addContent: associativeArray;
		addContent: stream.
	^ contents
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generateListOfFonts [
	| fonts |
	fonts := PDFDataAssociativeArray new.
	usedFonts
		do: [ :aFont | 
			fonts
				add:
					(PDFDataCouple key: (PDFDataSymbol symbol: 'F1') value: (PDFDataReference reference: (self createFontObject: aFont))) ].
	^ fonts
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generatePDFDocument: aPDFDocument [
	"should receive a PDFDocument and return a PDFDataObject representing the document"
	
	| associativeArray references resources |
	
	aPDFDocument explore.
	
	document := self createNewPDFDataObject.
	associativeArray := PDFDataAssociativeArray new.
	associativeArray add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'Pages')).
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
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'XObject') value: PDFDataAssociativeArray new).
	associativeArray add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Resources') value: resources).
	document addContent: associativeArray.
	
	document explore.
	^ document
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generatePDFFormat: aPDFFormat [
	^ PDFDataCouple new
		key: (PDFDataSymbol symbol: 'MediaBox');
		value: (PDFDataArray from: {0 . 0 . aPDFFormat width . aPDFFormat height } )
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generatePDFPage: aPDFPage [
	| page associativeArray |
	page := self createNewPDFDataObject.
	associativeArray := PDFDataAssociativeArray
		new
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Type') value: (PDFDataSymbol symbol: 'Page'));
		add: (PDFDataCouple key: (PDFDataSymbol symbol: 'Parent') value: (PDFDataReference reference: document));
		add: (self generatePDFFormat: (aPDFPage format ifNil: [ aPDFPage document format ]));
		add:
				(PDFDataCouple
						key: (PDFDataSymbol symbol: 'Contents')
						value: (PDFDataReference reference: (self generateContentsFor: aPDFPage)));
		yourself.
	page addContent: associativeArray.
	^ page
]

{ #category : #'as yet unclassified' }
PDFGenerator >> generatePDFVersion: aPDFVersion [
	^ PDFDataComment new comment: ('PDF-' , aPDFVersion).
		
]

{ #category : #'as yet unclassified' }
PDFGenerator >> initialize [
	currentObjectNumber := 0.
	usedFonts := Set new.
]

{ #category : #'as yet unclassified' }
PDFGenerator >> registerFontsForCodeSegments: aCollectionOfCodeSegments [
	aCollectionOfCodeSegments
		do: [ :aCodeSegment | 
			[ usedFonts add: (aCodeSegment styleSheet get: #font) fontName ]
				on: NotFound
				do: [  ] ].
]
