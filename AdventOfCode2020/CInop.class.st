Class {
	#name : #CInop,
	#superclass : #CpuInstruction,
	#category : #AdventOfCode2020
}

{ #category : #'as yet unclassified' }
CInop >> toggleNopJmp [
	^ CIjmp new argument: argument asString; cpu: cpu
]
