Extension { #name : #UnitValue }

{ #category : #'*artefact' }
UnitValue >> abs [
	^ self value < 0
		ifTrue: [ self negated ]
		ifFalse: [ self ]
]
