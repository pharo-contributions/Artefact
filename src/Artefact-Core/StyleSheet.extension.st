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
