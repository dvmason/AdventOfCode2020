Class {
	#name : #BaselineOfAdventOfCode2020,
	#superclass : #BaselineOf,
	#category : #BaselineOfAdventOfCode2020
}

{ #category : #baselines }
BaselineOfAdventOfCode2020 >> anotherCase: spec [
	spec
		baseline: 'AnotherCase' with: [ spec repository: 'github://dvmason/AnotherCase:main' ]

]

{ #category : #baselines }
BaselineOfAdventOfCode2020 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
		"Dependencies"
			self
				anotherCase: spec;
				functional: spec.
		"Packages"
			spec
				package: #AdventOfCode2020;
				package: 'AdventOfCode2020-Tests'  with: [ spec requires: #(AdventOfCode2020) ]
		]
]

{ #category : #baselines }
BaselineOfAdventOfCode2020 >> functional: spec [
	spec
		baseline: 'PharoFunctional' with: [ spec repository: 'github://dvmason/Pharo-Functional' ]
]
