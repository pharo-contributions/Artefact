"
A PDFClockElement is a basic tutorial element about how to create composite.

Instance Variables
	time:		<Object>

time
	- xxxxx

"
Class {
	#name : #PDFClockElement,
	#superclass : #PDFComposite,
	#instVars : [
		'time'
	],
	#category : #'Artefact-Examples-Tutorial'
}

{ #category : #steps }
PDFClockElement class >> clockTutorialStep1 [
	"I will generate a PDF with the clock step example"

	<script>
	(PDFDocument element: (PDFPage element: ((self from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current))) exportTo: (self streamNamed: 'clockTutorialStep1.pdf')
]

{ #category : #steps }
PDFClockElement class >> clockTutorialStep2 [
	"I will generate a PDF with the clock step example"

	<script>
	| doc |
	doc := PDFDocument element: (PDFPage element: ((self from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
	(doc styleSheet > #clock)
		drawColor: (PDFColor r: 180 g: 24 b: 24);
		fillColor: (PDFColor r: 230 g: 230 b: 10).
	doc exportTo: (self streamNamed: 'clockTutorialStep2.pdf')
]

{ #category : #steps }
PDFClockElement class >> clockTutorialStep3 [
	"I will generate a PDF with the clock step example"

	<script>
	| doc |
	doc := PDFDocument element: (PDFPage element: ((self from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
	(doc styleSheet > #clock)
		drawColor: (PDFColor r: 180 g: 24 b: 24);
		fillColor: (PDFColor r: 230 g: 230 b: 10).
	doc styleSheet > #clock > #arrow drawColor: (PDFColor r: 0 g: 45 b: 200).
	doc exportTo: (self streamNamed: 'clockTutorialStep3.pdf')
]

{ #category : #steps }
PDFClockElement class >> clockTutorialStep4 [
	"I will generate a PDF with the clock step example"

	<script>
	| doc |
	doc := PDFDocument element: (PDFPage element: ((self from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
	(doc styleSheet > #clock)
		drawColor: (PDFColor r: 180 g: 24 b: 24);
		fillColor: (PDFColor r: 230 g: 230 b: 10).
	doc styleSheet > #clock > #hourHand drawColor: (PDFColor r: 0 g: 45 b: 200).
	doc styleSheet > #clock > #minuteHand drawColor: (PDFColor r: 0 g: 200 b: 45).
	doc exportTo: (self streamNamed: 'clockTutorialStep4.pdf')
]

{ #category : #steps }
PDFClockElement class >> clockTutorialStep5 [
	"I will generate a PDF with the clock step example"

	<script>
	| doc |
	doc := PDFDocument
		element:
			(PDFPage
				elements:
					{((self from: 2 cm @ 2 cm to: 10 cm @ 10 cm)
						time: Time current;
						yourself) . ((self from: 12 cm @ 2 cm to: 20 cm @ 10 cm)
						time: Time current;
						style: #apocalypseClock;
						yourself)}).
	(doc styleSheet > #clock)
		drawColor: (PDFColor r: 180 g: 24 b: 24);
		fillColor: (PDFColor r: 230 g: 230 b: 10).
	doc styleSheet > #clock > #hourHand drawColor: (PDFColor r: 0 g: 45 b: 200).
	doc styleSheet > #clock > #minuteHand drawColor: (PDFColor r: 0 g: 200 b: 45).
	(doc styleSheet > #apocalypseClock)
		fillColor: (PDFColor r: 244 g: 221 b: 25);
		thickness: 2 mm;
		roundCap: true.
	(doc styleSheet > #apocalypseClock > #minuteHand)
		drawColor: (PDFColor r: 240 g: 6 b: 7);
		thickness: 1 mm.
	doc exportTo: (self streamNamed: 'clockTutorialStep5.pdf')
]

{ #category : #tool }
PDFClockElement class >> streamNamed: aName [
	| file |
	file := aName asFileReference.
	file ensureDelete.
	self flag: #todo.	"The next expression is a hack to correct a Pharo 6/7 compatibility.
	We need a binary write stream to print on but the way to get one changed between Pharo 6 and 7. To improve the code we could add a Pharo^ compatibility package that would add #binaryWriteStream to Pharo 6, but I have not time for now, I just want to make demos work.
	"
	^ SystemVersion current major < 7
		ifTrue: [ file writeStream
				binary;
				yourself ]
		ifFalse: [ file binaryWriteStream ]
]

{ #category : #style }
PDFClockElement >> defaultStyle [
	^ #clock
]

{ #category : #render }
PDFClockElement >> getSubElementsWith: aGenerator styleSheet: aStyleSheet [
	| hourAngle minuteAngle |
	hourAngle := Float pi / 2 - (time hour12 * 2 * Float pi / 12).
	minuteAngle := Float pi / 2 - (time minute * 2 * Float pi / 60).
	^ {(PDFCircleElement from: self from to: self to).
	(PDFCircleElement center: self center radius: self dimension min * 0.05).
	((PDFArrowElement from: self center angle: hourAngle length: dimension min * 0.25) style: #hourHand).
	((PDFArrowElement from: self center angle: minuteAngle length: dimension min * 0.45) style: #minuteHand)}
]

{ #category : #accessing }
PDFClockElement >> time [
	^ time
]

{ #category : #accessing }
PDFClockElement >> time: anObject [
	time := anObject
]
