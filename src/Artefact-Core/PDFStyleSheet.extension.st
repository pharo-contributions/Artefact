Extension { #name : #PDFStyleSheet }

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> alignment [
	^ self get: #alignment
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> alignment: aPDFAlignment [
	self at: #alignment put: aPDFAlignment 
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> dotted: aPDFDotted [
	self at: #dotted put: aPDFDotted 
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> drawColor: aPDFColor [
	self at: #drawColor put: aPDFColor 
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> fillColor: aPDFColor [
	self at: #fillColor put: aPDFColor 
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> filled [
	^ self get: #filled
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> filled: aBoolean [
	self at: #filled put: aBoolean 
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> font [
	^ self get: #font
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> font: aFont [
	self at: #font put: aFont 
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> margin [
	^ self get: #margin
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> margin: aMargin [
	self at: #margin put: aMargin 
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> opacity [
	^ self get: #opacity
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> opacity: aOpacity [
	self at: #opacity put: aOpacity
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> rotation: anAngle [
	self at: #rotation put: anAngle
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> roundCap: aBoolean [
	self at: #roundCap put: aBoolean 
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> textColor: aColor [
	self at: #textColor put: aColor 
]

{ #category : #'*Artefact-Core' }
PDFStyleSheet >> thickness: aThickness [
	self at: #thickness put: aThickness 
]
