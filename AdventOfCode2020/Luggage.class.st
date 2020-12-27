"
I represent a bag of luggage.

I am used in AOC2020 day 7.
"
Class {
	#name : #Luggage,
	#superclass : #Object,
	#instVars : [
		'enclosing',
		'contains'
	],
	#category : #'AdventOfCode2020-Core'
}

{ #category : #adding }
Luggage >> canBeEnclosedBy: aLuggage [ 
	enclosing add: aLuggage.

]

{ #category : #adding }
Luggage >> enclose: anInteger of: aLuggage [ 
	contains add: aLuggage withOccurrences: anInteger.
	aLuggage canBeEnclosedBy: self.
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

{ #category : #enumerating }
Luggage >> numberOfEnclosedBags [
	| count |
	count := 1.
	contains doWithOccurrences: [: enclosed : number |
		count := count + (number * enclosed numberOfEnclosedBags)
	].
	^ count
]
