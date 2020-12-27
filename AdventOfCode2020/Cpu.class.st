"
I represent a CPU used in AOC2020 day 7.

I have an array of CpuInstruction objects that do all the work.
"
Class {
	#name : #Cpu,
	#superclass : #Object,
	#instVars : [
		'instructions',
		'pc',
		'accumulator'
	],
	#classVars : [
		'Opcodes'
	],
	#category : #'AdventOfCode2020-Core'
}

{ #category : #'class initialization' }
Cpu class >> initialize [
	Opcodes := Dictionary new.
	Opcodes at: #nop put: CInop.
	Opcodes at: #jmp put: CIjmp.
	Opcodes at: #acc put: CIacc.

]

{ #category : #accessing }
Cpu >> accumulator [
	^ accumulator
]

{ #category : #accessing }
Cpu >> accumulator: anInteger [ 
	accumulator := anInteger
]

{ #category : #initialization }
Cpu >> addInstruction: aString [ 
	| ss |
	ss := aString substrings.
	instructions add: ((Opcodes at: ss first) new argument: ss second; cpu: self).

]

{ #category : #initialization }
Cpu >> initialize [
	super initialize.
	instructions := OrderedCollection new.
	accumulator := 0.

]

{ #category : #initialization }
Cpu >> load: aCollection [ 
	aCollection do: [: instr | self addInstruction: instr ].

]

{ #category : #accessing }
Cpu >> numberOfInstructions [
	^ instructions size
]

{ #category : #accessing }
Cpu >> pc [
	^ pc
]

{ #category : #accessing }
Cpu >> pc: anInteger [ 
	pc := anInteger
]

{ #category : #execution }
Cpu >> run [
	| instr |
	pc := 1.
	instructions do: #setFirstExecution.
	accumulator := 0.
	[ (instr := instructions at: pc) isFirstExecution ] whileTrue: [
		instr execute.
		pc > instructions size ifTrue: [ ^ true ]
	].
	^ false
]

{ #category : #control }
Cpu >> toggleNopJmp: anInteger [ 
	instructions at: anInteger put: (instructions at: anInteger) toggleNopJmp.

]
