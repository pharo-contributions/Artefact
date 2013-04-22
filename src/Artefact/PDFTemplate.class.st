Class {
	#name : #PDFTemplate,
	#superclass : #PDFPage,
	#category : #Artefact
}

{ #category : #action }
PDFTemplate >> drawTemplate [
	self subclassResponsibility 
]

{ #category : #'initialize-release' }
PDFTemplate >> initialize [
	super initialize.
	self drawTemplate.	

]
