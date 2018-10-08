"
A PDFPngElement is the pdf representation of an image

"
Class {
	#name : #PDFPngElement,
	#superclass : #PDFImage,
	#category : #'Artefact-Core-Elements-Basic'
}

{ #category : #'instance creation' }
PDFPngElement class >> fromMorph: aMorph [
	| imgpng |
	
	imgpng := ReadWriteStream  on: (ByteArray new).
	PNGReadWriter new on: imgpng; nextPutImage: (aMorph imageForm).
	^ self fromStream: imgpng
		
]

{ #category : #accessing }
PDFPngElement >> stream: anImageStream [
	| readWriter |
	"The PNG is converted to JPEG"
	stream := (ReadWriteStream with: (ByteArray new)).
	(PluginBasedJPEGReadWriter on: stream) nextPutImage: (PNGReadWriter on: anImageStream) nextImage.
		
	readWriter := (JPEGReadWriter on: stream)
		nextImage;
		yourself.
	originalImageDimensions := readWriter width pt @ readWriter height pt.
	

	

	

]
