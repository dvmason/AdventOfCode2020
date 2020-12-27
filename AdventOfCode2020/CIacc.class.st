"
I represent a CPU instruction used in AOC2020 day 7.

I add my argument to the accumulator in the Cpu object.
"
Class {
	#name : #CIacc,
	#superclass : #CpuInstruction,
	#category : #'AdventOfCode2020-Core'
}

{ #category : #execution }
CIacc >> execute [
	cpu accumulator: cpu accumulator + argument.
	super execute.

]
