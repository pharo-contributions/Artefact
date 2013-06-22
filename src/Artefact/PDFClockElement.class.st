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
	#category : #'Artefact-Tutorial'
}

{ #category : #'as yet unclassified' }
PDFClockElement class >> clockTutorial [
	"PDFClockElement clockTutorial"

	| doc |
	doc := PDFDocument new.
		doc add: (PDFPage new add: ((PDFClockElement from: 2 cm @ 2 cm to: 10 cm @ 10 cm) time: Time current)).
		doc styleSheet > #clock fillColor:( PDFColor r: 98 g: 154 b: 89).
		doc exportTo: 'clockTutorial.pdf' asFileReference writeStream
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
	(PDFArrowElement from: self center angle: hourAngle length: dimension min * 0.25).
	(PDFArrowElement from: self center angle: minuteAngle length: dimension min * 0.45)}
]

{ #category : #accessing }
PDFClockElement >> time [
	^ time
]

{ #category : #accessing }
PDFClockElement >> time: anObject [
	time := anObject
]
