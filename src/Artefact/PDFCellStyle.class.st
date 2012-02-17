Class {
	#name : #PDFCellStyle,
	#superclass : #PDFText,
	#instVars : [
		'border',
		'linefeed'
	],
	#category : #Artefact
}

{ #category : #accessing }
PDFCellStyle >> border [
	^ border ifNil: [ border := false ]
]

{ #category : #accessing }
PDFCellStyle >> border: anObject [
	border := anObject
]

{ #category : #accessing }
PDFCellStyle >> linefeed [
	^ linefeed ifNil: [ linefeed := false ]
]

{ #category : #accessing }
PDFCellStyle >> linefeed: anObject [
	linefeed := anObject
]

{ #category : #render }
PDFCellStyle >> render: aDocument [


	| buffer |
	
	buffer := String new.
	
	(self border) ifTrue: [ buffer :=  (xy x asString) , ' -' , (self xy y asString) , ' ' , (self wh x asString), ' -' , (self wh y asString) , 're S' , String cr ].

	((self text) isEmpty) ifFalse: [ 	
		buffer := buffer , 'BT ' , ((self xy x + (0.15 * aDocument currentFont fontSize)) roundDownTo: 0.001) asString , ' -' , ((self xy y + (0.5 * self wh y) + (0.3 * aDocument currentFont fontSize)) roundDownTo: 0.001) asString , ' Td (' , (self prepareText: self text) , ') Tj Et'.
	].
	
	 ^buffer
	

"
	//Output a cell
	if($this->y+$h>$this->PageBreakTrigger && $this->AutoPageBreak Nothing more expected -> && !$this->InFooter)
		$this->AddPage();
	if($border==1)
		$this->_out($this->x.' -'.$this->y.' '.$w.' -'.$h.' re S');
	if($txt!='')
	{
		$txt=str_replace(')','\\)',str_replace('(','\\(',str_replace('\\','\\\\',$txt)));
		$this->_out('BT '.($this->x+.15*$this->FontSize).' -'.($this->y+.5*$h+.3*$this->FontSize).' Td ('.$txt.') Tj ET');
	}
	$this->lasth=$h;
	if($ln==1)
	{
		//Go to next line
		$this->x=$this->lMargin;
		$this->y+=$h;
	}
	else
		$this->x+=$w;
"
	

]
