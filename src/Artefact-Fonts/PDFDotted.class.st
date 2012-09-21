Class {
	#name : #PDFDotted,
	#superclass : #Object,
	#instVars : [
		'length',
		'space'
	],
	#category : #Artefact
}

{ #category : #'as yet unclassified' }
PDFDotted >> getConfigurationInto: aDocument [
	"Answer the dotted configuration"
	
	^ '[' , (((self length * aDocument scaleFactor) roundDownTo: 0.001) asString), ' ' , (((self space * aDocument scaleFactor) roundDownTo: 0.001) asString) , '] 0 d'.

	
	
"
        if($black!==null)
            $s=sprintf('[%.3F %.3F] 0 d',$black*$this->k,$white*$this->k);
        else
            $s='[] 0 d';
        $this->_out($s);

aDocument scaleFactor) / 1000)) roundDownTo: 0.001	
"
]

{ #category : #accessing }
PDFDotted >> length [
	^ length ifNil: [ length := 1 ]
]

{ #category : #accessing }
PDFDotted >> length: anObject [
	length := anObject
]

{ #category : #accessing }
PDFDotted >> space [
	^ space ifNil: [ space := 1 ]
]

{ #category : #accessing }
PDFDotted >> space: anObject [
	space := anObject
]
