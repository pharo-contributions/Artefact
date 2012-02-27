Class {
	#name : #PDFPNGImage,
	#superclass : #PDFImage,
	#category : #Artefact
}

{ #category : #test }
PDFPNGImage >> readTest [
| t |
t := PNGReadWriter formFromFileNamed: '/Users/olivier/Desktop/images/pharo.png'.
t explore.
]
