Extension { #name : #Array }

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
