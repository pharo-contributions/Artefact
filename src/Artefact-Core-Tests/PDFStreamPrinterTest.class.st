Class {
	#name : #PDFStreamPrinterTest,
	#superclass : #TestCase,
	#instVars : [
		'aStream',
		'printer'
	],
	#category : #'Artefact-Core-Tests-Generator'
}

{ #category : #'tests - compression' }
PDFStreamPrinterTest >> testGenerateGZipCompression [

	| result |

	result := OrderedCollection new.

	(PDFStreamPrinter new compressWithGZip: 'hello') do: [ :byte | result add: byte asInteger ].

	self assert: result equals: #( 120 156 203 72 205 201 201 7 0 6 44 2 21) asOrderedCollection
]
