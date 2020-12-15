"
I represent a Waypoint for AOC 2020 Day 12b
"
Class {
	#name : #WayPoint,
	#superclass : #NavPosition,
	#instVars : [
		'navPosition'
	],
	#category : #AdventOfCode2020
}

{ #category : #initialization }
WayPoint >> initialize [
	super initialize.
	north := 1.
	east := 10.

]

{ #category : #moving }
WayPoint >> moveForward: multiplier [
	navPosition
		moveNorth: north*multiplier;
		moveEast: east*multiplier.

]

{ #category : #initialization }
WayPoint >> navPosition: aNavPosition [ 
	navPosition := aNavPosition.

]

{ #category : #moving }
WayPoint >> rotateRight: anInteger [ 
	| temp |
	self validateRotation: anInteger.
	(anInteger//90)%4 timesRepeat: [
		temp := north.
		north := east negated.
		east := temp
	]
]
