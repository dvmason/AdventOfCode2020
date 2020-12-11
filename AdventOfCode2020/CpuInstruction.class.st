Class {
	#name : #CpuInstruction,
	#superclass : #Object,
	#instVars : [
		'argument',
		'cpu',
		'isFirstExecution'
	],
	#category : #AdventOfCode2020
}

{ #category : #'as yet unclassified' }
CpuInstruction >> argument: aString [ 
	argument := aString first = $+ ifTrue: [aString allButFirst asNumber] ifFalse: [aString asNumber].

]

{ #category : #'as yet unclassified' }
CpuInstruction >> cpu: aCpu [ 
	cpu := aCpu.

]

{ #category : #'as yet unclassified' }
CpuInstruction >> execute [
	cpu pc: cpu pc + 1.
	isFirstExecution := false.


]

{ #category : #initialization }
CpuInstruction >> initialize [
	super initialize.
	isFirstExecution := true.

]

{ #category : #'as yet unclassified' }
CpuInstruction >> isFirstExecution [
	^ isFirstExecution
]

{ #category : #'as yet unclassified' }
CpuInstruction >> setFirstExecution [
	isFirstExecution := true.

]

{ #category : #'as yet unclassified' }
CpuInstruction >> toggleNopJmp [

]
