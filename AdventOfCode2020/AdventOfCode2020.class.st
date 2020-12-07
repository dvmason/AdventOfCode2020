Class {
	#name : #AdventOfCode2020,
	#superclass : #Object,
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

{ #category : #'as yet unclassified' }
AdventOfCode2020 >> day05Convert: aString [
	^ aString lines collect: [: line |
			('2r',line trim translateWith: BoardingPassTable) asNumber
		]
]

{ #category : #'as yet unclassified' }
AdventOfCode2020 >> day05a: aString [
	^ (self day05Convert: aString) max
]

{ #category : #'as yet unclassified' }
AdventOfCode2020 >> day05b: aString [
	| prev |
	prev := -3.
	(self day05Convert: aString) asSortedCollection do: [: each |
		(each - 2) = prev ifTrue: [ ^ each - 1 ] ifFalse: [ prev := each ] ]
]
