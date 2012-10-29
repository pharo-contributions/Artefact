Class {
	#name : #PDFDataTableStyle,
	#superclass : #PDFDataTable,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFDataTableStyle >> getStyles [ 
	"answer a representation of a datatable"

	self data do: [ :line |
		line do: [ :value | 
			elements add: (PDFCellStyle new 
				wh: self wh; 
				styleSheet: (self styleSheet); 
				text: value).
			]. 
			elements add: (PDFLineFeed new).
		].
	
	 ^elements

]

{ #category : #render }
PDFDataTableStyle >> renderContentOn: aPage [
	"answer the content of a datatable"
		
	(self columns isNil) ifFalse: [
		self columns do: [ :string | 
			self out: (PDFCellStyle new 
				wh: self wh; 
				ink: (self inkForColumns);
				fillColor: (self fillColorForColumns);
				border: true;
				font: (self font); 
				text: string; 
				alignToCenter). 
			]
		].
	
	self out: (PDFLineFeed new).
	
	(self data isNil) ifFalse: [
		self data do: [ :line |
			line do: [ :value |
				self out: (PDFCellStyle new
				wh: self wh;
				ink: self ink;
				fillColor: self fillColor;
				border: true;
				font: self font;
				text: value;
				alignToCenter).
				].
				self out: (PDFLineFeed new).
			].
		].
	
	^self buffer
	
]
