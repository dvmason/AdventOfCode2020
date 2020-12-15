"
I represent a CPU instruction used in AOC2020 day 7.

I do nothing, except the PC is advanced to the next instruction.
"
Class {
	#name : #CInop,
	#superclass : #CpuInstruction,
	#category : #AdventOfCode2020
}

{ #category : #control }
CInop >> toggleNopJmp [
	^ CIjmp new argument: argument asString; cpu: cpu
]
