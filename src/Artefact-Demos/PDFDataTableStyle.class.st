Class {
	#name : #PDFDataTableStyle,
	#superclass : #PDFDataTable,
	#category : #'Artefact-Styles'
}

{ #category : #render }
PDFDataTableStyle >> getStyles [ 
	"answer a representation of a datatable"
	
	| position |
	
	position := self xy.
	
	self data do: [ :line |
		line do: [ :value | 
			elements add: (PDFCellStyle new 
				xy: position; 
				wh: self wh; 
				styleSheet: (self styleSheet); 
				text: value).
			position := ((position x) + (self wh x)) @ position y.
		].
		position := (self xy x) @ (position y + self wh y).
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
	
	self out: (PDFLineFeedStyle new).
	
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
				self out: (PDFLineFeedStyle new).
			].
		].
	
	^self buffer
	
]
