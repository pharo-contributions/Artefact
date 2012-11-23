"
PDFPNGImage has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.

| stream reader |

stream := FileStream readOnlyFileNamed:  '/Users/olivier/Desktop/artefact/pharo.png'.
stream binary.
reader := PNGReadWriter new on: stream reset.
reader nextImage.
reader explore.
stream close.
"
Class {
	#name : #PDFPNGImage,
	#superclass : #PDFImage,
	#category : #'Artefact-Elements'
}

{ #category : #action }
PDFPNGImage >> fileName: aFileName [
	"Load a picture and answer an object that describe the picture"
	
	| stream reader |
	
	stream := FileStream readOnlyFileNamed:  aFileName.
	stream binary.
	"reader := PNGReadWriter new on: stream reset."
	reader := PNGReadWriter new on: stream reset.
	reader nextImage.
	stream close.
	Transcript show: (reader colorType asString).
	^reader
]
