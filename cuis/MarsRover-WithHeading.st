!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:27:29'!
test17MarsRoverWithNoCommandsShowsEmptyPositionLog

	| marsRover logger|
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	logger := Logger new.
	
	marsRover addPositionWatcher: logger.
	
	self assert: (OrderedCollection new) equals: logger show.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:31:34'!
test18MarsRoverWithNoCommandsShowsEmptyPositionWindow

	| marsRover stateWindow|
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	stateWindow := StateWindow new.
	
	marsRover addPositionWatcher: stateWindow.
	
	self assert: '' equals: stateWindow show.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:43:56'!
test19MarsRoverWithForwardLogsPosition

	| marsRover expectedLogs logger|
	
	marsRover := MarsRover at: 1@1 heading: self north.
	logger := Logger new.
	
	marsRover addPositionWatcher: logger.
	marsRover process: 'f'.
	
	expectedLogs := OrderedCollection  new.
	expectedLogs  add: '1@2'.
	
	self assert: expectedLogs equals: logger show.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:45:54'!
test20MarsRoverWithTwiceForwardLogsAllPositions

	| marsRover expectedLogs logger|
	
	marsRover := MarsRover at: 1@1 heading: self north.
	logger := Logger new.
	
	marsRover addPositionWatcher: logger.
	marsRover process: 'ff'.
	
	expectedLogs := OrderedCollection  new.
	expectedLogs  add: '1@2'.
	expectedLogs  add: '1@3'.	
	
	self assert: expectedLogs equals: logger show.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:46:28'!
test21MarsRoverWithTwiceForwardShowsPositionWindow

	| marsRover statusWindow|
	
	marsRover := MarsRover at: 1@1 heading: self north.
	statusWindow := StateWindow new.
	
	marsRover addPositionWatcher: statusWindow.
	marsRover process: 'ff'.
	
	self assert: '1@3' equals: statusWindow show.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:47:55'!
test22MarsRoverWithNoCommandsShowsEmptyHeadingLog

	| marsRover logger|
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	logger := Logger new.
	
	marsRover addHeadingWatcher: logger.
	
	self assert: (OrderedCollection new) equals: logger show.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:51:50'!
test23MarsRoverWithoutCommandsShowsEmptyHeadingWindow

	| marsRover statusWindow|
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	statusWindow := StateWindow new.
	
	marsRover addHeadingWatcher: statusWindow.
	
	self assert: '' equals: statusWindow show.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:52:19'!
test24MarsRoverWithRotateCommandShowsHeadingLog

	| marsRover expectedLogs logger|
	
	marsRover := MarsRover at: 1@1 heading: self north.
	logger := Logger new.
	
	marsRover addHeadingWatcher: logger.
	marsRover process: 'r'.
	
	expectedLogs := OrderedCollection  new.
	expectedLogs  add: 'East'.
	
	self assert: expectedLogs equals: logger show .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 02:26:58'!
test25MarsRoverWithTwiceRotateCommandLogsAllHeadings

	| marsRover expectedLogs logger|
	
	marsRover := MarsRover at: 1@1 heading: self north.
	logger := Logger new.
	
	marsRover addHeadingWatcher: logger.
	marsRover process: 'rr'.
	
	expectedLogs := OrderedCollection  new.
	expectedLogs  add: 'East'.
	expectedLogs  add: 'South'.
	
	self assert: expectedLogs equals: logger show .! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 02:27:45'!
test26MarsRoverWithoutCommandsShowsEmptyPositionHeadingLog

	| marsRover logger|
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	logger := Logger new.
	
	marsRover addPositionWatcher: logger.
	
	self assert: (OrderedCollection new) equals: logger show.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 03:00:39'!
test27MarsRoverWithForwardAndRotationShowsPositionHeadingLog

	| marsRover logger expectedLogs|
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	logger := Logger new.
	
	marsRover addPositionWatcher: logger.
	marsRover addHeadingWatcher: logger.

	marsRover process: 'fr'.
	
	expectedLogs := OrderedCollection  new.
	expectedLogs  add: '1@2'.
	expectedLogs  add: 'East'.	

	self assert: expectedLogs equals: logger show.! !


!classDefinition: #Logger category: 'MarsRover-WithHeading'!
Object subclass: #Logger
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Logger methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:30:27'!
initialize

	log := OrderedCollection new.! !

!Logger methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:26:40'!
notify: aValue

	log add: aValue.! !

!Logger methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:27:09'!
show

	^ log ! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!



!MarsRover methodsFor: 'testing'!
! !

!MarsRover methodsFor: 'testing'!
! !

!MarsRover methodsFor: 'testing' stamp: 'ma 6/5/2023 02:47:46'!
isAt: aPosition heading: aHeadingType

	^(position value = aPosition) and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'reading'!
! !


!MarsRover methodsFor: 'initialization'!
! !

!MarsRover methodsFor: 'initialization' stamp: 'ma 6/5/2023 01:49:03'!
initializeAt: aPosition heading: aHeadingType

	position := VariableWatch with: aPosition.
	head := VariableWatch with: (aHeadingType for: self).! !


!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'heading' stamp: 'ma 6/5/2023 02:22:51'!
headEast
	
	head update: (MarsRoverHeadingEast for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'ma 6/5/2023 02:22:24'!
headNorth
	
	head update: (MarsRoverHeadingNorth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'ma 6/5/2023 02:23:07'!
headSouth
	
	head update: (MarsRoverHeadingSouth for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'ma 6/5/2023 02:23:20'!
headWest
	
	head update: (MarsRoverHeadingWest for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	head rotateLeft! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	head rotateRight! !


!MarsRover methodsFor: 'moving' stamp: 'ma 6/5/2023 01:57:25'!
addToPosition: aPositionIncrement

	position updateAdd: aPositionIncrement.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	head moveBackward! !

!MarsRover methodsFor: 'moving' stamp: 'ma 6/5/2023 02:58:03'!
moveEast
	
	self addToPosition: 1@0! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	head moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'ma 6/5/2023 01:57:12'!
moveNorth
	
	self addToPosition: 0@1! !

!MarsRover methodsFor: 'moving' stamp: 'ma 6/5/2023 02:57:31'!
moveSouth
	
	self addToPosition: 0@-1! !

!MarsRover methodsFor: 'moving' stamp: 'ma 6/5/2023 02:57:44'!
moveWest
	
	self addToPosition: -1@0! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:48:39'!
addHeadingWatcher: aWatcher

	head addWatcher: aWatcher ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:14:34'!
addPositionWatcher: aWatcher

	position addWatcher: aWatcher ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'initialization'!
! !


!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!MarsRoverHeadingEast methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 02:24:30'!
asString

	^ 'East'! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!MarsRoverHeadingNorth methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 02:25:23'!
asString

	^ 'North'! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!MarsRoverHeadingSouth methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 02:25:34'!
asString

	^ 'South'! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!MarsRoverHeadingWest methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 02:25:47'!
asString

	^ 'West'! !


!classDefinition: #StateWindow category: 'MarsRover-WithHeading'!
Object subclass: #StateWindow
	instanceVariableNames: 'status'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!StateWindow methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:42:18'!
initialize

	status := ''! !

!StateWindow methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:33:13'!
notify: aValue

	status := aValue! !

!StateWindow methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:38:17'!
show
	
	^status! !


!classDefinition: #VariableWatch category: 'MarsRover-WithHeading'!
Object subclass: #VariableWatch
	instanceVariableNames: 'value watchers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!VariableWatch methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:06:52'!
addWatcher: aWatcher

	watchers add: aWatcher.! !

!VariableWatch methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:55:56'!
doesNotUnderstand: aMessage

	^ aMessage sendTo: value! !

!VariableWatch methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:04:57'!
initialize 

	watchers := Set new. ! !

!VariableWatch methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 00:45:30'!
initializeWith: aValue

	value := aValue ! !

!VariableWatch methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:41:56'!
notify

	watchers do: [ :aWatcher | aWatcher notify: value asString].! !

!VariableWatch methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:59:40'!
update: aValue

	value := aValue.
	self notify.! !

!VariableWatch methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 01:00:12'!
updateAdd: aValue

	value := value + aValue.
	self notify.! !

!VariableWatch methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 02:35:34'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariableWatch class' category: 'MarsRover-WithHeading'!
VariableWatch class
	instanceVariableNames: ''!

!VariableWatch class methodsFor: 'as yet unclassified' stamp: 'ma 6/5/2023 00:45:13'!
with: aValue

 	^ self new initializeWith: aValue ! !
