"
A PDFJpegElement is the pdf representation of an image



"
Class {
	#name : #PDFJpegElement,
	#superclass : #PDFImage,
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #'instance creation' }
PDFJpegElement class >> fromMorph: aMorph [

	| image |
	image := ReadWriteStream on: ByteArray new.
	PluginBasedJPEGReadWriter new
		on: image;
		nextPutImage: aMorph imageForm.

	^ self fromStream: image
]

{ #category : #accessing }
PDFJpegElement >> stream: anImageStream [

	| readWriter |
	stream := anImageStream.	"Compute original dimensions for this image"
	readWriter := (JPEGReadWriter on: anImageStream)
		nextImage;
		yourself.
	originalImageDimensions := readWriter width pt @ readWriter height pt
]
