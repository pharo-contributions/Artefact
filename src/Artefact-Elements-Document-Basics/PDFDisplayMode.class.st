Class {
	#name : #PDFDisplayMode,
	#superclass : #PDFDocumentBasicElement,
	#instVars : [
		'displayMode',
		'zoom'
	],
	#category : #'Artefact-Elements-Document-Basics'
}

{ #category : #private }
PDFDisplayMode >> argsByDisplayModeDictionary [
	^Dictionary new
		at: #default put:  '';
		at: #fullPage put: '[3 0 R /Fit]';
		at: #fullWidth put:  '[3 0 R /FitH null]';
		at: #real put: '[3 0 R /XYZ null null 1]';
		at: #zoomMode put: ('[' , self genZoomCode , ']');
		yourself.
]

{ #category : #configuration }
PDFDisplayMode >> default [
	displayMode := #default	
]

{ #category : #accessing }
PDFDisplayMode >> displayMode [
	^ displayMode
]

{ #category : #accessing }
PDFDisplayMode >> displayMode: anObject [
	displayMode := anObject
]

{ #category : #configuration }
PDFDisplayMode >> fullPage [
	displayMode := #fullPage	
]

{ #category : #configuration }
PDFDisplayMode >> fullWidth [
	displayMode := #fullWidth	
]

{ #category : #private }
PDFDisplayMode >> genZoomCode [
	"answer the PDF code to set the zoom value"
	^('3 0 R /XYZ null null ' , ((zoom / 100) asFloat asString)) 
]

{ #category : #'initialize-release' }
PDFDisplayMode >> initialize [ 
	super initialize.
	zoom := 100.
	self default
	
]

{ #category : #builder }
PDFDisplayMode >> isDefault [
	^ self displayMode = #default
]

{ #category : #builder }
PDFDisplayMode >> produceDocumentElementCodeOn: aDocument [
	^(String streamContents: [ :s | self isDefault ifFalse: [
		s nextPutAll: PDFByteCode openAction; 
		space; 
		nextPutAll: (self argsByDisplayModeDictionary at: displayMode).]
	] )
]

{ #category : #configuration }
PDFDisplayMode >> real [
	displayMode := #real	
]

{ #category : #configuration }
PDFDisplayMode >> zoomMode: aPercentage [
	displayMode := #zoomMode.
	zoom := aPercentage
]
