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

	| image |
	image := ReadWriteStream  on: (ByteArray new).
	PNGReadWriter new on: image; nextPutImage: (aMorph imageForm).
	^ self fromStream: image
]

{ #category : #accessing }
PDFPngElement >> stream: anImageStream [

	| readWriter |
	"The PNG is converted to JPEG"
	stream := (ReadWriteStream with: (ByteArray new)).

	self flag: 'The next line is a hack because Pharo is currently under migration and we do not know yet what is the best way to manage this on Pharo 6 and 7'.
	(anImageStream respondsTo: #reset) ifTrue: [ anImageStream reset ].
	(PluginBasedJPEGReadWriter on: stream) nextPutImage: (PNGReadWriter on: anImageStream) nextImage.

	self flag: 'The next line is a hack because Pharo is currently under migration and we do not know yet what is the best way to manage this on Pharo 6 and 7'.
	(stream respondsTo: #reset) ifTrue: [ stream reset ].
	readWriter := (JPEGReadWriter on: stream)
		nextImage;
		yourself.
	originalImageDimensions := readWriter width pt @ readWriter height pt
]
