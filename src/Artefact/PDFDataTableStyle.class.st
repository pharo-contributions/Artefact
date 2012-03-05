Class {
	#name : #PDFDataTableStyle,
	#superclass : #PDFText,
	#instVars : [
		'columns',
		'data',
		'inkForColumns',
		'fillColorForColumns'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFDataTableStyle >> columns [
	^ columns
]

{ #category : #accessing }
PDFDataTableStyle >> columns: anObject [
	columns := anObject
]

{ #category : #accessing }
PDFDataTableStyle >> data [
	^ data
]

{ #category : #accessing }
PDFDataTableStyle >> data: anObject [
	data := anObject
]

{ #category : #accessing }
PDFDataTableStyle >> fillColorForColumns [
	^ fillColorForColumns ifNil: [ fillColorForColumns := self fillColor ]
]

{ #category : #accessing }
PDFDataTableStyle >> fillColorForColumns: anObject [
	fillColorForColumns := anObject
]

{ #category : #accessing }
PDFDataTableStyle >> inkForColumns [
	^ inkForColumns ifNil: [ inkForColumns := self ink ]
]

{ #category : #accessing }
PDFDataTableStyle >> inkForColumns: anObject [
	inkForColumns := anObject
]

{ #category : #'as yet unclassified' }
PDFDataTableStyle >> renderContentOn: aDocument [ 
	"answer the content of a datatable"
	
	| pos |
	
	pos := self xy.
	
	(self columns isNil) ifFalse: [
		self columns do: [ :string | 
			self out: (PDFCellStyle new 
				xy: pos;
				wh: self wh; 
				ink: (self inkForColumns);
				fillColor: (self fillColorForColumns);
				border: true;
				font: (self font); 
				text: string; 
				alignToCenter). 
				pos := (pos x + self wh x)@pos y.
			]
		].
	
	pos := (self xy x)@(pos y + wh y).

	(self data isNil) ifFalse: [
		self data do: [ :line |
			line do: [ :value |
				self out: (PDFCellStyle new
				xy: pos;
				wh: self wh;
				ink: self ink;
				fillColor: self fillColor;
				border: true;
				font: self font;
				text: value;
				alignToCenter).
				pos := (pos x + self wh x)@pos y.
				].
				pos := (self xy x)@(pos y + wh y).
			].
		].
	^self buffer
	
]
