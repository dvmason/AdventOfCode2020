"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAdventOfCode2020,
	#superclass : #PackageManifest,
	#category : #'AdventOfCode2020-Manifest'
}

{ #category : #'code-critics' }
ManifestAdventOfCode2020 class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGPackageDefinition #(#AdventOfCode2020)) #'2020-12-12T21:40:11.31307-05:00') )
]

{ #category : #'code-critics' }
ManifestAdventOfCode2020 class >> ruleStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#AdventOfCode2020)) #'2020-12-09T00:00:33.853696-05:00') )
]

{ #category : #'code-critics' }
ManifestAdventOfCode2020 class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#AdventOfCode2020)) #'2020-12-12T21:39:59.029781-05:00') )
]
