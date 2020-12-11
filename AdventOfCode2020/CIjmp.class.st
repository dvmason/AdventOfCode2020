Class {
	#name : #CIjmp,
	#superclass : #CpuInstruction,
	#category : #AdventOfCode2020
}

{ #category : #'as yet unclassified' }
CIjmp >> execute [
	cpu pc: cpu pc + argument.
	isFirstExecution := false.


]

{ #category : #'as yet unclassified' }
CIjmp >> toggleNopJmp [
	^ CInop new argument: argument asString; cpu: cpu
]
