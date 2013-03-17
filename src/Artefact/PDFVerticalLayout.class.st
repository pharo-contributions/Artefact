"
A PDFVerticalLayout is a layout capable to display elements vertically.

Instance Variables

"
Class {
	#name : #PDFVerticalLayout,
	#superclass : #PDFLayout,
	#category : #'Artefact-Elements-Layouts'
}

{ #category : #'as yet unclassified' }
PDFVerticalLayout >> computeNextElementPositionWith: aPDFGenerator styleSheet: aStyleSheet elementPosition: aPosition dimension: aDimension [
	^ aPosition + ( 0 pt @ aDimension y)
]
