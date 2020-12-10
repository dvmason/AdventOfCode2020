Class {
	#name : #Luggage,
	#superclass : #Object,
	#instVars : [
		'enclosing',
		'contains'
	],
	#category : #AdventOfCode2020
}

{ #category : #adding }
Luggage >> canBeEnclosedBy: aLuggage [ 
	enclosing add: aLuggage.

]

{ #category : #'as yet unclassified' }
Luggage >> enclose: anInteger of: aLuggage [ 
	contains add: aLuggage withOccurrences: anInteger.
	aLuggage canBeEnclosedBy: self.
]

{ #category : #'as yet unclassified' }
Luggage >> enclosesBags: aCollection [ 
	self shouldBeImplemented.
]

{ #category : #enumerating }
Luggage >> enclosingBags: aSet [
	enclosing do: [ :each |
		(aSet includes: each) ifFalse: [ aSet add: each. each enclosingBags: aSet ]].
	^ aSet
]

{ #category : #initialization }
Luggage >> initialize [
	super initialize.
	enclosing := Set new.
	contains := Bag new.


]

{ #category : #'as yet unclassified' }
Luggage >> numberOfEnclosedBags [
	| count |
	count := 1.
	contains doWithOccurrences: [: enclosed : number |
		count := count + (number * enclosed numberOfEnclosedBags)
	].
	^ count
]
