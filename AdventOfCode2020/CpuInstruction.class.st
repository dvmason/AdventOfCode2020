"
I represent a generic CPU instruction used in AOC2020 day 7.

I have a reference to the Cpu of which I am a part, so that I can access its registers.

My execution and control methods are overridden in some specific instructions.
"
Class {
	#name : #CpuInstruction,
	#superclass : #Object,
	#instVars : [
		'argument',
		'cpu',
		'isFirstExecution'
	],
	#category : #'AdventOfCode2020-Core'
}

{ #category : #initialization }
CpuInstruction >> argument: aString [ 
	argument := aString first = $+ ifTrue: [aString allButFirst asNumber] ifFalse: [aString asNumber].

]

{ #category : #initialization }
CpuInstruction >> cpu: aCpu [ 
	cpu := aCpu.

]

{ #category : #execution }
CpuInstruction >> execute [
	cpu pc: cpu pc + 1.
	isFirstExecution := false.


]

{ #category : #initialization }
CpuInstruction >> initialize [
	super initialize.
	isFirstExecution := true.

]

{ #category : #accessing }
CpuInstruction >> isFirstExecution [
	^ isFirstExecution
]

{ #category : #accessing }
CpuInstruction >> setFirstExecution [
	isFirstExecution := true.

]

{ #category : #control }
CpuInstruction >> toggleNopJmp [

]
