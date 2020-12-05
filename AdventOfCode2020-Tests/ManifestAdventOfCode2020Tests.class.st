"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAdventOfCode2020Tests,
	#superclass : #PackageManifest,
	#category : #'AdventOfCode2020-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestAdventOfCode2020Tests class >> ruleMethodSourceContainsLinefeedsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#AdventOfCode2020Tests)) #'2020-12-04T00:37:12.563302-05:00') )
]
