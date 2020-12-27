"
I represent a CPU instruction used in AOC2020 day 7.

I am an unconditional jump to the relative instruction offset by the argument.
"
Class {
	#name : #CIjmp,
	#superclass : #CpuInstruction,
	#category : #'AdventOfCode2020-Core'
}

{ #category : #execution }
CIjmp >> execute [
	cpu pc: cpu pc + argument.
	isFirstExecution := false.


]

{ #category : #control }
CIjmp >> toggleNopJmp [
	^ CInop new argument: argument asString; cpu: cpu
]
