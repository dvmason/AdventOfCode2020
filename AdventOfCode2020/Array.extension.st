Extension { #name : #Array }

{ #category : #'*AdventOfCode2020' }
Array >> countFrom: base startAt: start withMemo: memo [
	| count |
	count := 0.
	self size < start ifTrue: [ ^ 1 ].
	(memo at: start) ifNotNil: [: value | ^ value ].
	base + 3 >= (self at: start) ifTrue: [ 
		count := count +
		         (self
			          countFrom: (self at: start)
			          startAt: start + 1
			          withMemo: memo) ].
	self size >= (start + 1) ifTrue: [ 
		base + 3 >= (self at: start + 1) ifTrue: [ 
			count := count +
			         (self
				          countFrom: (self at: start + 1)
				          startAt: start + 2
				          withMemo: memo) ] ].
	self size >= (start + 2) ifTrue: [ 
		base + 3 >= (self at: start + 2) ifTrue: [ 
			count := count +
			         (self
				          countFrom: (self at: start + 2)
				          startAt: start + 3
				          withMemo: memo) ] ].
	memo at: start put: count.
	^ count
]

{ #category : #'*AdventOfCode2020' }
Array >> day01a [
	self withIndexDo: [: first : index |
		(self allButFirst: index) do: [: second |
			first+second = 2020 ifTrue: [ ^ first * second ]
		]
	]
]

{ #category : #'*AdventOfCode2020' }
Array >> day01b [
	self withIndexDo: [: first : index1 |
		(self allButFirst: index1) withIndexDo: [: second : index2 |
			(self allButFirst: index1+index2) do: [: third |
				first+second+third = 2020 ifTrue: [ ^ first * second * third ]
			]
		]
	]
]

{ #category : #'*AdventOfCode2020' }
Array >> day09a: skip [
	| target found |
	skip+1 to: self size do: [: index |
		target := self at: index.
		found := false.
		index-skip to: index-1 do: [: idx2 |
			index-skip to: index-1 do: [: idx3 |
				idx2 ~= idx3 ifTrue: [
					(self at: idx2)+(self at: idx3) = target ifTrue: [ found := true ]
		] ] ].
		found ifFalse: [ ^ target ]
	]
]

{ #category : #'*AdventOfCode2020' }
Array >> day09b: skip [ 
	| target sum smallest largest |
	target := self day09a: skip.
	1 to: self size do: [: start |
		sum := 0.
		smallest := largest := self at: start.
		start to: self size do: [: index | | v |
			v := self at: index.
			smallest > v ifTrue: [ smallest := v ].
			largest < v ifTrue: [ largest := v ].
			sum := sum + v.
			sum = target ifTrue: [ ^ smallest+largest ]
		]
	]
]

{ #category : #'*AdventOfCode2020' }
Array >> day10a [
	| previous ones threes |
	ones := threes := previous := 0.
	self sorted do: [: joltage |
		joltage - previous = 1 ifTrue: [ ones := ones + 1 ].
		joltage - previous = 3 ifTrue: [ threes := threes + 1 ].
		previous := joltage.
	].
	^ ones * (threes + 1)

]

{ #category : #'*AdventOfCode2020' }
Array >> day10b [
	^ self sorted countFrom: 0 startAt: 1 withMemo: (Array new: self size)
]
