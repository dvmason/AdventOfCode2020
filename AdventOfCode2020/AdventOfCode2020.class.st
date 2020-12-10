"
I represent a solution holder for the Advent of Code 2020.

I contain methods for individual days/problems, as well as helper methods.

There are several extensions to various system classes that are part of the solutions as well.
"
Class {
	#name : #AdventOfCode2020,
	#superclass : #Object,
	#instVars : [
		'luggage'
	],
	#classVars : [
		'BoardingPassTable'
	],
	#category : #AdventOfCode2020
}

{ #category : #'class initialization' }
AdventOfCode2020 class >> initialize [
	BoardingPassTable := String withAll: (Character allByteCharacters 
		collect: [:c | ('LF' includes: c) ifTrue: [ $0 ] ifFalse: [ ('BR' includes: c) ifTrue: [ $1 ] ifFalse: [ c ]]]).

]

{ #category : #helpers }
AdventOfCode2020 >> bagCalled: name [ 
	^ luggage at: name ifAbsentPut: [ Luggage new ]
]

{ #category : #helpers }
AdventOfCode2020 >> day05Convert: aString [
	^ aString lines collect: [: line |
			('2r',line trim translateWith: BoardingPassTable) asNumber
		]
]

{ #category : #'day code' }
AdventOfCode2020 >> day05a: aString [
	^ (self day05Convert: aString) max
]

{ #category : #'day code' }
AdventOfCode2020 >> day05b: aString [
	| prev |
	prev := -3.
	(self day05Convert: aString) asSortedCollection do: [: each |
		(each - 2) = prev ifTrue: [ ^ each - 1 ] ifFalse: [ prev := each ] ]
]

{ #category : #helpers }
AdventOfCode2020 >> day06Counting: aString init: iBlock counter: cBlock [
	| count currentGroupAnswers groupSize |
	count := 0.
	groupSize := 0.
	currentGroupAnswers := iBlock value.
	aString lines do: [: line |
		line ifEmpty: [
			count := count + (cBlock value: currentGroupAnswers value: groupSize).
			currentGroupAnswers := iBlock value.
			groupSize := 0.
		] ifNotEmpty: [
			groupSize := groupSize + 1.
			line do: [: char | currentGroupAnswers add: char ]
		]
	].
	count := count + (cBlock value: currentGroupAnswers value: groupSize).
	^ count
]

{ #category : #'day code' }
AdventOfCode2020 >> day06a: aString [ 
	^ self day06Counting: aString init: [Set new] counter: [: set : ignore | set size ]
]

{ #category : #'day code' }
AdventOfCode2020 >> day06b: aString [ 
		^ self day06Counting: aString init: [Bag new] counter: [: bag : numberInGroup |
				| count |
				count := 0.
				bag keysAndValuesDo: [: key : value |
					value = numberInGroup ifTrue: [ count := count + 1 ]
				].
				count
			]
]

{ #category : #helpers }
AdventOfCode2020 >> day07LoadRules: rules [
	luggage := Dictionary new.
	rules lines do: [ :line | 
		| enclosingBag colour shade number |
		colour := shade := number := enclosingBag := nil.
		(' ' split: line) do: [ :word | 
			(word beginsWith: 'bag')
				ifTrue: [ 
					enclosingBag
						ifNil: [ enclosingBag := self bagCalled: shade , ' ' , colour ]
						ifNotNil: [
							number = #contain ifFalse: [
							enclosingBag enclose: number asNumber of: (self bagCalled: shade , ' ' , colour)
					]]]
				ifFalse: [
					number := shade.
					shade := colour.
					colour := word ] ] ].

]

{ #category : #helpers }
AdventOfCode2020 >> day07a: rules with: target [
	self day07LoadRules: rules.
	^ ((self bagCalled: target) enclosingBags: Set new) size
]

{ #category : #'as yet unclassified' }
AdventOfCode2020 >> day07b: rules with: target [
	self day07LoadRules: rules.
	^ (self bagCalled: target) numberOfEnclosedBags - 1
]

{ #category : #initialization }
AdventOfCode2020 >> initialize [
	super initialize.
	luggage := Dictionary new.

]
