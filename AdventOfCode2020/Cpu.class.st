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
	#category : #AdventOfCode2020
}

{ #category : #'class initialization' }
Cpu class >> initialize [
	Opcodes := Dictionary new.
	Opcodes at: #nop put: CInop.
	Opcodes at: #jmp put: CIjmp.
	Opcodes at: #acc put: CIacc.

]

{ #category : #'as yet unclassified' }
Cpu >> accumulator [
	^ accumulator
]

{ #category : #'as yet unclassified' }
Cpu >> accumulator: anInteger [ 
	accumulator := anInteger
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
Cpu >> load: aCollection [ 
	aCollection do: [: instr | self addInstruction: instr ].

]

{ #category : #'as yet unclassified' }
Cpu >> numberOfInstructions [
	^ instructions size
]

{ #category : #'as yet unclassified' }
Cpu >> pc [
	^ pc
]

{ #category : #'as yet unclassified' }
Cpu >> pc: anInteger [ 
	pc := anInteger
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
Cpu >> toggleNopJmp: anInteger [ 
	instructions at: anInteger put: (instructions at: anInteger) toggleNopJmp.

]
