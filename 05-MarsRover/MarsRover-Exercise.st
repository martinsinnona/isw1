!classDefinition: #MarsRoverTests category: 'MarsRover-Exercise'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test01TheRoverDoesNotMoveWithEmptyCommand	
	
	|rover initialPosition|
	
	rover := MarsRover initializeAt: 2@3 facing: North new. 
	initialPosition := rover actualPosition.
	
	rover readCommandPackage: ''.
	
	self assert: rover actualPosition equals: initialPosition
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test02TheRoverMovesWithSingleForwardCommand
	
	|rover |
	
	rover := MarsRover initializeAt: 2@3 facing: North new.
	
	rover readCommandPackage: 'f'.
	
	self assert: rover actualPosition equals: 2@4.
	self assert: rover actualDirection equals: North new.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test03TheRoverMovesWithSingleBackwardCommand
	
	|rover |
	
	rover := MarsRover initializeAt: 2@3 facing: North new.
	
	rover readCommandPackage: 'b'.
	
	self assert:  2@2 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test04TheRoverMovesWithSingleForwardCommandWithAnotherInitialPosition
	
	|rover |
	
	rover := MarsRover initializeAt: 0@0 facing: North new.
	
	rover readCommandPackage: 'f'.
	
	self assert:  0@1 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test05TheRoverMovesWithSingleBackwardCommandWithAnotherInitialPosition
	
	|rover |
	
	rover := MarsRover initializeAt: 1@1 facing: North new.
	
	rover readCommandPackage: 'b'.
	
	self assert:  1@0 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test06TheRoverDoesNotMovesWithEmptyCommandWithAnotherInitialPosition
	
	|rover |
	
	rover := MarsRover initializeAt: 0@0 facing: North new.
	
	rover readCommandPackage: ''.
	
	self assert:  0@0 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test07TheRoverMovesWithSingleForwardCommandFacingSouth
	
	|rover |
	
	rover := MarsRover initializeAt: 1@1 facing: South new.
	
	rover readCommandPackage: 'f'.
	
	self assert:  1@0 equals: rover actualPosition.
	self assert: South new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test08TheRoverMovesWithSingleBackwardCommandFacingSouth
	
	|rover |
	
	rover := MarsRover initializeAt: 1@1 facing: South new.
	
	rover readCommandPackage: 'b'.
	
	self assert:  1@2 equals: rover actualPosition.
	self assert: South new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test09TheRoverMovesWithSingleForwardCommandFacingEast
	
	|rover |
	
	rover := MarsRover initializeAt: 1@1 facing: East new.
	
	rover readCommandPackage: 'f'.
	
	self assert:  2@1 equals: rover actualPosition.
	self assert: East new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test10TheRoverMovesWithSingleBackwardCommandFacingEast
	
	|rover |
	
	rover := MarsRover initializeAt: 1@1 facing: East new.
	
	rover readCommandPackage: 'b'.
	
	self assert:  0@1 equals: rover actualPosition.
	self assert: East new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test11TheRoverRotatesToLeftWhenFacingNorth
	
	|rover |
	
	rover := MarsRover initializeAt: 1@1 facing: North new.
	
	rover readCommandPackage: 'l'.
	
	self assert:  1@1 equals: rover actualPosition.
	self assert: West new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test12TheRoverRotatesToLeftWhenFacingSouth
	
	|rover |
	
	rover := MarsRover initializeAt: 1@1 facing: South new.
	
	rover readCommandPackage: 'l'.
	
	self assert:  1@1 equals: rover actualPosition.
	self assert: East new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test13TheRoverRotatesToLeftWhenFacingNorth
	
	|rover |
	
	rover := MarsRover initializeAt: 1@1 facing: North new.
	
	rover readCommandPackage: 'r'.
	
	self assert:  1@1 equals: rover actualPosition.
	self assert: East new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test14TheRoverMovesForwardTwiceFacingNorth
	
	|rover |
	
	rover := MarsRover initializeAt: 1@1 facing: North new.
	
	rover readCommandPackage: 'ff'.
	
	self assert:  1@3 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test15TheRoverMovesBackwardTwiceFacingNorth
	
	|rover |
	
	rover := MarsRover initializeAt: 2@2 facing: North new.
	
	rover readCommandPackage: 'bb'.
	
	self assert:  2@0 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test16TheRoverMovesForwardAndBackwardFacingNorth
	
	|rover |
	
	rover := MarsRover initializeAt: 2@2 facing: North new.
	
	rover readCommandPackage: 'fb'.
	
	self assert:  2@2 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test17TheRoverMovesForwardTwiceFacingSouth
	
	|rover |
	
	rover := MarsRover initializeAt: 2@2 facing: South new.
	
	rover readCommandPackage: 'ff'.
	
	self assert:  2@0 equals: rover actualPosition.
	self assert: South new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test18TheRoverMovesForwardThriceFacingSouth
	
	|rover |
	
	rover := MarsRover initializeAt: 2@3 facing: South new.
	
	rover readCommandPackage: 'fff'.
	
	self assert:  2@0 equals: rover actualPosition.
	self assert: South new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test19TheRoverMovesForwardTwiceAndBackwardFacingSouth
	
	|rover |
	
	rover := MarsRover initializeAt: 2@3 facing: South new.
	
	rover readCommandPackage: 'ffb'.
	
	self assert:  2@2 equals: rover actualPosition.
	self assert: South new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test20TheRoverReceivesInvalidCommandAndStopsReadingCommands
	
	|rover |
	
	rover := MarsRover initializeAt: 0@0 facing: North new.
	
	rover readCommandPackage: 'f@f'.
	
	self assert:  0@1 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test21TheRoverReceivesAnotherInvalidCommandAndStopsReadingCommands
	
	|rover |
	
	rover := MarsRover initializeAt: 0@0 facing: North new.
	
	rover readCommandPackage: 'f#f'.
	
	self assert:  0@1 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !

!MarsRoverTests methodsFor: 'nil' stamp: 'ma 5/14/2023 23:19:57'!
test22TheRoverReceivesACyclicCommandAndEndsAtInitialPosition
	
	|rover |
	
	rover := MarsRover initializeAt: 0@0 facing: North new.
	
	rover readCommandPackage: 'frfrfrfr'.
	
	self assert:  0@0 equals: rover actualPosition.
	self assert: North new equals: rover actualDirection.
	
! !


!classDefinition: #CardinalDirection category: 'MarsRover-Exercise'!
Object subclass: #CardinalDirection
	instanceVariableNames: 'direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!CardinalDirection methodsFor: 'initialization' stamp: 'ma 5/14/2023 19:47:03'!
initializeWith: aDirection

	direction := aDirection ! !


!CardinalDirection methodsFor: 'equals' stamp: 'ma 5/14/2023 23:23:31'!
= aCardinalDirection

	^ direction = aCardinalDirection direction ! !


!CardinalDirection methodsFor: 'directions' stamp: 'ma 5/14/2023 21:13:56'!
direction

	^direction! !

!CardinalDirection methodsFor: 'directions' stamp: 'ma 5/14/2023 21:10:42'!
directionToMoveBackward
	
	self subclassResponsibility ! !

!CardinalDirection methodsFor: 'directions' stamp: 'ma 5/14/2023 21:05:36'!
directionToMoveForward
	
	self subclassResponsibility ! !

!CardinalDirection methodsFor: 'directions' stamp: 'ma 5/14/2023 21:13:49'!
directionToRotateLeft
	
	self subclassResponsibility ! !

!CardinalDirection methodsFor: 'directions' stamp: 'ma 5/14/2023 21:11:01'!
directionToRotateRight
	
	self subclassResponsibility ! !


!classDefinition: #East category: 'MarsRover-Exercise'!
CardinalDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!East methodsFor: 'directions' stamp: 'ma 5/14/2023 21:08:57'!
directionToMoveBackward

	^ self directionToMoveForward negated
! !

!East methodsFor: 'directions' stamp: 'ma 5/14/2023 21:08:47'!
directionToMoveForward

	^ (1@0)	
! !

!East methodsFor: 'directions' stamp: 'ma 5/14/2023 21:21:39'!
directionToRotateLeft
	
	^ North new
! !

!East methodsFor: 'directions' stamp: 'ma 5/14/2023 21:21:43'!
directionToRotateRight
	
	^ South new
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'MarsRover-Exercise'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'as yet unclassified' stamp: 'ma 5/14/2023 21:20:56'!
new

	^ self basicNew initializeWith: #East ! !


!classDefinition: #North category: 'MarsRover-Exercise'!
CardinalDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!North methodsFor: 'directions' stamp: 'ma 5/14/2023 21:07:04'!
directionToMoveBackward

	^ self directionToMoveForward negated
! !

!North methodsFor: 'directions' stamp: 'ma 5/14/2023 21:06:36'!
directionToMoveForward

	^ (0@1)	
! !

!North methodsFor: 'directions' stamp: 'ma 5/14/2023 21:21:48'!
directionToRotateLeft
	
	^ West new
! !

!North methodsFor: 'directions' stamp: 'ma 5/14/2023 21:22:03'!
directionToRotateRight
	
	^ East new
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'MarsRover-Exercise'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'as yet unclassified' stamp: 'ma 5/14/2023 21:20:49'!
new

	^ self basicNew initializeWith: #North ! !


!classDefinition: #South category: 'MarsRover-Exercise'!
CardinalDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!South methodsFor: 'directions' stamp: 'ma 5/14/2023 21:07:49'!
directionToMoveBackward

	^ self directionToMoveForward negated.
! !

!South methodsFor: 'directions' stamp: 'ma 5/14/2023 21:07:34'!
directionToMoveForward

	^ (0@-1)	
! !

!South methodsFor: 'directions' stamp: 'ma 5/14/2023 21:22:21'!
directionToRotateLeft
	
	^ East new
! !

!South methodsFor: 'directions' stamp: 'ma 5/14/2023 21:22:27'!
directionToRotateRight
	
	^ West new
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'MarsRover-Exercise'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'as yet unclassified' stamp: 'ma 5/14/2023 21:21:01'!
new

	^ self basicNew initializeWith: #South ! !


!classDefinition: #West category: 'MarsRover-Exercise'!
CardinalDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!West methodsFor: 'directions' stamp: 'ma 5/14/2023 21:09:18'!
directionToMoveBackward

	^ self directionToMoveForward negated
! !

!West methodsFor: 'directions' stamp: 'ma 5/14/2023 21:09:09'!
directionToMoveForward

	^ (-1@0)
! !

!West methodsFor: 'directions' stamp: 'ma 5/14/2023 21:22:33'!
directionToRotateLeft
	
	^ South new
! !

!West methodsFor: 'directions' stamp: 'ma 5/14/2023 21:22:39'!
directionToRotateRight
	
	^ North new
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'MarsRover-Exercise'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'as yet unclassified' stamp: 'ma 5/14/2023 21:21:04'!
new

	^ self basicNew initializeWith: #West ! !


!classDefinition: #MarsRover category: 'MarsRover-Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'actualPosition actualDirection commands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Exercise'!

!MarsRover methodsFor: 'movement' stamp: 'ma 5/14/2023 23:05:53'!
moveBackward

	^ actualPosition := actualPosition + actualDirection directionToMoveBackward! !

!MarsRover methodsFor: 'movement' stamp: 'ma 5/14/2023 23:05:39'!
moveForward

	^ actualPosition := actualPosition + actualDirection directionToMoveForward! !


!MarsRover methodsFor: 'rotation' stamp: 'ma 5/14/2023 23:06:08'!
rotateLeft

	^ actualDirection := actualDirection directionToRotateLeft! !

!MarsRover methodsFor: 'rotation' stamp: 'ma 5/14/2023 23:06:22'!
rotateRight

	^ actualDirection := actualDirection directionToRotateRight! !


!MarsRover methodsFor: 'testing' stamp: 'ma 5/14/2023 23:21:00'!
actualDirection

	^ actualDirection ! !

!MarsRover methodsFor: 'testing' stamp: 'ma 5/14/2023 23:21:03'!
actualPosition

	^ actualPosition! !


!MarsRover methodsFor: 'reading' stamp: 'ma 5/14/2023 23:20:53'!
readCommandPackage: aCommandString 
	
	aCommandString do: [ :aCommand | (commands at: aCommand ifAbsent: [^self]) value.].

! !


!MarsRover methodsFor: 'initialization' stamp: 'ma 5/14/2023 23:14:03'!
initializeAt: aPosition facing: aDirection
	
	actualPosition := aPosition.
	actualDirection := aDirection.
	commands := Dictionary new.
	
	commands at: $f put: [self moveForward ];
			at: $b put: [self moveBackward ];
			at: $l put: [self rotateLeft ];
			at: $r put: [self rotateRight ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'ma 5/14/2023 20:47:59'!
initializeAt: aPosition facing: aDirection
	
	^self new initializeAt: aPosition facing: aDirection! !

