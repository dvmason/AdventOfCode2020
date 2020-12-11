Class {
	#name : #CIacc,
	#superclass : #CpuInstruction,
	#category : #AdventOfCode2020
}

{ #category : #'as yet unclassified' }
CIacc >> execute [
	cpu accumulator: cpu accumulator + argument.
	super execute.

]
