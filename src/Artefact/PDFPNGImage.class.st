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
	#category : #Artefact
}

{ #category : #test }
PDFPNGImage >> readTest [
| t |
t := PNGReadWriter formFromFileNamed: '/Users/olivier/Desktop/images/pharo.png'.
t explore.
]
