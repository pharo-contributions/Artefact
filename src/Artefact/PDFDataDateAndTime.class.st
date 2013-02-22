Class {
	#name : #PDFDataDateAndTime,
	#superclass : #PDFDataType,
	#instVars : [
		'date',
		'time'
	],
	#category : #'Artefact-DataType'
}

{ #category : #'as yet unclassified' }
PDFDataDateAndTime class >> date: aDate time: aTime [
	^ self new date: aDate; time: aTime; yourself
]

{ #category : #'as yet unclassified' }
PDFDataDateAndTime >> acceptVisitor: aVisitor [
	^ aVisitor visitPDFDataDateAndTime: self
]

{ #category : #accessing }
PDFDataDateAndTime >> date [
	^ date
]

{ #category : #accessing }
PDFDataDateAndTime >> date: anObject [
	date := anObject
]

{ #category : #'as yet unclassified' }
PDFDataDateAndTime >> formatDate: aDate time: aTime [
	"Answer a correct date and time for a PDF document : yyyymmddhhmmss"
	
	| str timeStr hour minutes seconds |

	hour := aTime hours.
	str := hour asString.
	(hour < 12) ifTrue: [ str := '0' , str ].
	timeStr := str.
	
 	minutes := aTime minutes.
	str := minutes asString.
	(minutes < 10) ifTrue: [ str := '0' , str ].
	timeStr := timeStr , str.
	
	seconds := aTime seconds.
	str := seconds asString.
	(seconds < 10) ifTrue: [ str := '0' , str ].
	timeStr := timeStr , str.
	
	^((aDate yyyymmdd copyWithRegex: '-' matchesReplacedWith: '') , timeStr)
]

{ #category : #'as yet unclassified' }
PDFDataDateAndTime >> isPrintable [
	^ true
]

{ #category : #accessing }
PDFDataDateAndTime >> printOn: aStream [
	aStream nextPutAll: '(D:'; nextPutAll: (self formatDate: (self date) time: (self time)); nextPut: $)
]

{ #category : #accessing }
PDFDataDateAndTime >> time [
	^ time
]

{ #category : #accessing }
PDFDataDateAndTime >> time: anObject [
	time := anObject
]
