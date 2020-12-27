"
I represent a Navigation Position for AOC2020 Day 12 parts a and b
"
Class {
	#name : #NavPosition,
	#superclass : #Object,
	#instVars : [
		'orientation',
		'east',
		'north'
	],
	#category : #'AdventOfCode2020-Core'
}

{ #category : #controlling }
NavPosition >> command: aString [ 
	| number |
	number := aString allButFirst asNumber.
	aString first = $F ifTrue: [ ^ self moveForward: number ].
	aString first = $N ifTrue: [ ^ self moveNorth: number ].
	aString first = $S ifTrue: [ ^ self moveNorth: number negated ].
	aString first = $E ifTrue: [ ^ self moveEast: number ].
	aString first = $W ifTrue: [ ^ self moveEast: number negated ].
	aString first = $R ifTrue: [ ^ self rotateRight: number ].
	aString first = $L ifTrue: [ ^ self rotateRight: number negated ].
	self error: 'I do not understand ',aString
]

{ #category : #accessing }
NavPosition >> east [
	^ east
]

{ #category : #initialization }
NavPosition >> initialize [
	super initialize.
	orientation := 2. " East "
	north := east := 0.

]

{ #category : #accessing }
NavPosition >> manhattanDistance [
	^ self north abs + self east abs
]

{ #category : #moving }
NavPosition >> moveEast: anInteger [ 
	east := east + anInteger.

]

{ #category : #moving }
NavPosition >> moveForward: anInteger [ 
	| move |
	move := orientation > 2 ifTrue: [anInteger negated] ifFalse: [anInteger].
	orientation % 2 = 1 ifTrue: [
		self moveNorth: move
	] ifFalse: [
		self moveEast: move
	]
]

{ #category : #moving }
NavPosition >> moveNorth: anInteger [ 
	north := north + anInteger.

]

{ #category : #accessing }
NavPosition >> north [
	^ north
]

{ #category : #moving }
NavPosition >> rotateRight: anInteger [ 
	self validateRotation: anInteger.
	orientation := (orientation - 1 + (anInteger // 90))%4 + 1.

]

{ #category : #moving }
NavPosition >> validateRotation: anInteger [ 
	anInteger%90 ~= 0 ifTrue: [ ^ self error: 'Only turn multiples of 90' ].

]
