Extension { #name : #String }

{ #category : #'*AdventOfCode2020' }
String >> day02a [
	^ (self lines select: [: line | line isAOCValidPassword ]) size
]

{ #category : #'*AdventOfCode2020' }
String >> day02b [
		^ (self lines select: [: line | line isAOCValidPassword2 ]) size
]

{ #category : #'*AdventOfCode2020' }
String >> isAOCValidPassword [
	| strings |
	strings := self splitOn: [: char | char = $- or: [ char = $  ] ].
	^ (strings fourth select: [: char | char = strings third first ]) size
			between: strings first asNumber and: strings second asNumber
]

{ #category : #'*AdventOfCode2020' }
String >> isAOCValidPassword2 [
	| strings password char |
	strings := self splitOn: [: c | c = $- or: [ c = $  ] ].
	password := strings fourth.
	char := strings third first.
	^ (((password at: strings first asNumber)=char) asBit +
			((password at: strings second asNumber)=char) asBit) = 1
]
