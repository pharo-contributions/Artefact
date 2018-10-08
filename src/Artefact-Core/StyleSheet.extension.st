Extension { #name : #StyleSheet }

{ #category : #'*Artefact-Core' }
StyleSheet >> alignment [
	^ self get: #alignment
]

{ #category : #'*Artefact-Core' }
StyleSheet >> alignment: aPDFAlignment [
	self at: #alignment put: aPDFAlignment 
]

{ #category : #'*Artefact-Core' }
StyleSheet class >> default [
	| default |
	default:= self new 
		at: #textColor put: (PDFColor r: 0 g: 0 b: 0); 
		at: #fillColor put: (PDFColor r: 255 g: 255 b: 255); 
		at: #filled put: true;
		at: #drawColor put: (PDFColor r: 0 g: 0 b: 0);
		at: #thickness put: 1 pt;
		at: #dotted put: nil;
		at: #margin put: 0 pt;
		at: #roundCap put: false;
		at: #font put: PDFHelveticaFont new;
		at: #rotation put: 0;
		at: #alignment put: PDFAlignment left middle;
		at: #opacity put: (PDFOpacityNormal alpha: 1);
		yourself.
	default > #caption at: #fillColor put: (PDFColor new setGreyLevel: 192).
	default > #datatable at: #alignment put: PDFAlignment center middle.
	default > #cell at: #margin put: 1 pt.
	default > #cell at: #alignment put: PDFAlignment center middle.
	^ default
]

{ #category : #'*Artefact-Core' }
StyleSheet >> dotted: aPDFDotted [
	self at: #dotted put: aPDFDotted 
]

{ #category : #'*Artefact-Core' }
StyleSheet >> drawColor: aPDFColor [
	self at: #drawColor put: aPDFColor 
]

{ #category : #'*Artefact-Core' }
StyleSheet >> fillColor: aPDFColor [
	self at: #fillColor put: aPDFColor 
]

{ #category : #'*Artefact-Core' }
StyleSheet >> filled [
	^ self get: #filled
]

{ #category : #'*Artefact-Core' }
StyleSheet >> filled: aBoolean [
	self at: #filled put: aBoolean 
]

{ #category : #'*Artefact-Core' }
StyleSheet >> font [
	^ self get: #font
]

{ #category : #'*Artefact-Core' }
StyleSheet >> font: aFont [
	self at: #font put: aFont 
]

{ #category : #'*Artefact-Core' }
StyleSheet >> margin [
	^ self get: #margin
]

{ #category : #'*Artefact-Core' }
StyleSheet >> margin: aMargin [
	self at: #margin put: aMargin 
]

{ #category : #'*Artefact-Core' }
StyleSheet >> opacity [
	^ self get: #opacity
]

{ #category : #'*Artefact-Core' }
StyleSheet >> opacity: aOpacity [
	self at: #opacity put: aOpacity
]

{ #category : #'*Artefact-Core' }
StyleSheet >> rotation: anAngle [
	self at: #rotation put: anAngle
]

{ #category : #'*Artefact-Core' }
StyleSheet >> roundCap: aBoolean [
	self at: #roundCap put: aBoolean 
]

{ #category : #'*Artefact-Core' }
StyleSheet >> textColor: aColor [
	self at: #textColor put: aColor 
]

{ #category : #'*Artefact-Core' }
StyleSheet >> thickness: aThickness [
	self at: #thickness put: aThickness 
]
