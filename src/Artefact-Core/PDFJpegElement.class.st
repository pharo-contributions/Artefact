"
A PDFJpegElement is the pdf representation of an image



"
Class {
	#name : #PDFJpegElement,
	#superclass : #PDFImage,
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #accessing }
PDFJpegElement >> stream: anImageStream [
	| readWriter |
	stream := anImageStream.	"Compute original dimensions for this image"
	readWriter := (JPEGReadWriter on: anImageStream)
		nextImage;
		yourself.
	originalImageDimensions := readWriter width pt @ readWriter height pt.

]
