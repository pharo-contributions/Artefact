"
A PDFHorizontalLayout is a layout capable to display elements horizontally.

Instance Variables

"
Class {
	#name : #PDFHorizontalLayout,
	#superclass : #PDFLayout,
	#category : #'Artefact-Elements-Layouts'
}

{ #category : #'as yet unclassified' }
PDFHorizontalLayout >> computeNextElementPositionWith: aPDFGenerator styleSheet: aStyleSheet elementPosition: aPosition dimension: aDimension [
	^ aPosition + (aDimension x @ 0 pt)
]
