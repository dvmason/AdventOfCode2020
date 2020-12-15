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

{ #category : #'day code' }
AdventOfCode2020 >> day07b: rules with: target [
	self day07LoadRules: rules.
	^ (self bagCalled: target) numberOfEnclosedBags - 1
]

{ #category : #'day code' }
AdventOfCode2020 >> day08a: aString [ 
	| cpu |
	cpu := Cpu new load: aString lines.
	cpu run.
	^ cpu accumulator
]

{ #category : #'day code' }
AdventOfCode2020 >> day08b: aString [ 
	| cpu |
	cpu := Cpu new load: aString lines.
	1 to: cpu numberOfInstructions do: [: i |
		cpu toggleNopJmp: i.
		cpu run ifTrue: [ ^ cpu accumulator ].
		cpu toggleNopJmp: i.
	].
	self error: 'I ran to termination, which shouldn''t happen.'
]

{ #category : #'day code' }
AdventOfCode2020 >> day11a: aString [ 
	| neighbours |
	neighbours := { 	-1 @ -1 . -1 @ 0 . -1 @ 1 .
										 0 @ -1 .           0 @ 1 .
										 1 @ -1 .  1 @ 0 .  1 @ 1 }.
	^ self seatIteration: aString findNeighbours: [: previous : row : col | | occupied |
			occupied := 0.
			neighbours do: [: n |
				(previous at: row+n y at: col+n x) = $# ifTrue: [ occupied := occupied + 1 ] ].
			occupied ] crowded: 4
]

{ #category : #'day code' }
AdventOfCode2020 >> day11b: aString [ 
	| neighbours |
	neighbours := { 	-1 @ -1 . -1 @ 0 . -1 @ 1 .
										 0 @ -1 .           0 @ 1 .
										 1 @ -1 .  1 @ 0 .  1 @ 1 }.
	^ self seatIteration: aString findNeighbours: [: previous : row : col | | occupied tRow tCol |
			occupied := 0.
			neighbours do: [: n |
				tRow := row.
				tCol := col.
				[(previous at: (tRow := tRow + n y) at: (tCol := tCol + n x)) = $.] whileTrue.
				(previous at: tRow at: tCol) = $# ifTrue: [ occupied := occupied + 1 ].
			].
			occupied ] crowded: 5
]

{ #category : #'day code' }
AdventOfCode2020 >> day12a: aString [
	| np |
	np := NavPosition new.
	aString lines do: [: line |
		np command: line
	].
	^ np manhattanDistance
]

{ #category : #'day code' }
AdventOfCode2020 >> day12b: aString [
	| np wp |
	np := NavPosition new.
	wp := WayPoint new navPosition: np.
	aString lines do: [: line |
		wp command: line
	].
	^ np manhattanDistance
]

{ #category : #initialization }
AdventOfCode2020 >> initialize [
	super initialize.
	luggage := Dictionary new.

]

{ #category : #helpers }
AdventOfCode2020 >> seatIteration: aString findNeighbours: findNeighbours crowded: nNeighbours [
	| current empty previous count nRows nCols |
	current := aString lines collect: [: line | '*',line,'*' ].
	empty := current first collect: [: ignored | $* ].
	current := { empty },current,{ empty }.
	nRows := current size.
	nCols := empty size.
	current := Array2D rows: nRows columns: nCols contents: ('' join: current).
	previous := nil.
	count := 0.
	[  current = previous ] whileFalse: [
		previous := current deepCopy.
		2 to: nRows-1 do: [: row |
			2 to: nCols-1 do: [: col | | occupied char |
				occupied := findNeighbours value: previous value: row value: col.
				char := previous at: row at: col.
				(char = $L and: [ occupied = 0 ]) ifTrue: [ current at: row at: col put: $#. count := count + 1 ].
				(char = $# and: [ occupied >= nNeighbours ]) ifTrue: [ current at: row at: col put: $L. count := count - 1 ]
			]
		]
	].
	^ count
]
