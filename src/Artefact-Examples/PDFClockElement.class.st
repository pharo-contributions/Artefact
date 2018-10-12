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
	"PDFClockElement clockTutorialStep1"

	| doc |
	doc := PDFDocument new.
		doc add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
		doc exportTo: 'clockTutorialStep1.pdf' asFileReference writeStream
]

{ #category : #steps }
PDFClockElement class >> clockTutorialStep2 [
	"PDFClockElement clockTutorialStep2"

	| doc |
	doc := PDFDocument new.
		doc add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
		doc styleSheet > #clock drawColor: (PDFColor r:180 g: 24 b:24); fillColor: (PDFColor r:230 g: 230 b:10).
		doc exportTo: 'clockTutorialStep2.pdf' asFileReference writeStream
]

{ #category : #steps }
PDFClockElement class >> clockTutorialStep3 [
	"PDFClockElement clockTutorialStep3"

	| doc |
	doc := PDFDocument new.
		doc add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
		doc styleSheet > #clock drawColor: (PDFColor r:180 g: 24 b:24); fillColor: (PDFColor r:230 g: 230 b:10).
		doc styleSheet > #clock > #arrow drawColor: (PDFColor r:0 g: 45 b:200).
		doc exportTo: 'clockTutorialStep3.pdf' asFileReference writeStream
]

{ #category : #steps }
PDFClockElement class >> clockTutorialStep4 [
	"PDFClockElement clockTutorialStep4"

	| doc |
	doc := PDFDocument new.
		doc add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
		doc styleSheet > #clock drawColor: (PDFColor r:180 g: 24 b:24); fillColor: (PDFColor r:230 g: 230 b:10).
		doc styleSheet > #clock > #hourHand drawColor: (PDFColor r:0 g: 45 b:200).
		doc styleSheet > #clock > #minuteHand drawColor: (PDFColor r:0 g: 200 b:45).
		doc exportTo: 'clockTutorialStep4.pdf' asFileReference writeStream
]

{ #category : #steps }
PDFClockElement class >> clockTutorialStep5 [
	"PDFClockElement clockTutorialStep5"

	| doc |
	doc := PDFDocument new.
		doc add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current);
			 add: ((PDFClockElement from: 12 cm @ 2 cm to: 20 cm @ 10 cm) time: Time current; style: #apocalypseClock)).
		doc styleSheet > #clock drawColor: (PDFColor r:180 g: 24 b:24); fillColor: (PDFColor r:230 g: 230 b:10).
		doc styleSheet > #clock > #hourHand drawColor: (PDFColor r:0 g: 45 b:200).
		doc styleSheet > #clock > #minuteHand drawColor: (PDFColor r:0 g: 200 b:45).
		doc styleSheet > #apocalypseClock fillColor: (PDFColor r:244 g: 221 b:25); thickness: 2mm; roundCap: true.
		doc styleSheet > #apocalypseClock > #minuteHand drawColor: (PDFColor r:240 g: 6 b: 7); thickness: 1 mm.
		doc exportTo: 'clockTutorialStep5.pdf' asFileReference writeStream
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
