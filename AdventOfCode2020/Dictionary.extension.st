Extension { #name : #Dictionary }

{ #category : #'*AdventOfCode2020' }
Dictionary >> isValidPassport: aSymbol [
	self size = 8 ifFalse: [ ^ false ].
	aSymbol = #simple ifTrue: [ ^ true ].
	(self at: #byr) isValidBirthYear ifFalse: [ ^ false ].
	(self at: #iyr) isValidIssueYear ifFalse: [ ^ false ].
	(self at: #eyr) isValidExpirationYear ifFalse: [ ^ false ].
	(self at: #hgt) isValidHeight ifFalse: [ ^ false ].
	(self at: #ecl) isValidEyeColor ifFalse: [ ^ false ].
	(self at: #hcl) isValidHairColor ifFalse: [ ^ false ].
	(self at: #pid) isValidPassportID ifFalse: [ ^ false ].
	^ true
]
