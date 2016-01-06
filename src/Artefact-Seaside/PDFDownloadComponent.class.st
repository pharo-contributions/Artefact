Class {
	#name : #PDFDownloadComponent,
	#superclass : #WAComponent,
	#instVars : [
		'documentBlock',
		'fileName'
	],
	#category : #'Artefact-Seaside'
}

{ #category : #'as yet unclassified' }
PDFDownloadComponent class >> documentBlock: aPdfDocumentBlock fileName: aFileName [
	^ self new
		documentBlock: aPdfDocumentBlock;
		fileName: aFileName;
		yourself
]

{ #category : #accessing }
PDFDownloadComponent >> documentBlock [
	^ documentBlock
]

{ #category : #accessing }
PDFDownloadComponent >> documentBlock: anObject [
	documentBlock := anObject
]

{ #category : #rendering }
PDFDownloadComponent >> downloadPdf [
	self requestContext respond: [ :response |
		|stream|
		stream := (RWBinaryOrTextStream on: String new) binary.
		(self documentBlock value) exportTo: stream.
		response
            contentType: (WAMimeType main: 'application' sub: 'pdf');
            document: stream close; contents ;
            attachmentWithFileName: self fileName ]
]

{ #category : #accessing }
PDFDownloadComponent >> fileName [
	^ fileName
]

{ #category : #accessing }
PDFDownloadComponent >> fileName: anObject [
	fileName := anObject
]

{ #category : #rendering }
PDFDownloadComponent >> renderContentOn: html [
	html mdlButton with: [ html anchor
            callback: [ self downloadPdf ];
            with: (self translate: ('Download PDF' french: 'Télécharger le PDF'))]
]
