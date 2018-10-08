Extension { #name : #UnitValue }

{ #category : #'*Artefact-Core' }
UnitValue >> abs [
	^ self value < 0
		ifTrue: [ self negated ]
		ifFalse: [ self ]
]
