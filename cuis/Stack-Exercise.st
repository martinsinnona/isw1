!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'ma 4/21/2023 19:40:46'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.

	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'ma 4/21/2023 21:00:17'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	
	stack push: 'something'.	
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'ma 4/21/2023 23:50:51'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.

	stack pop.

	self assert: stack isEmpty.
! !

!OOStackTest methodsFor: 'test' stamp: 'ma 4/22/2023 00:00:10'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'ma 4/21/2023 19:41:44'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'ma 4/21/2023 19:41:52'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'ma 4/21/2023 19:42:00'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'ma 4/21/2023 19:42:07'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'ma 4/21/2023 19:42:14'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'ma 4/21/2023 19:42:26'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		

! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:51:26'!
test01
	| stack |
	
	stack := OOStack new.
	stack 
		push: 'hola';
		push: 'chau';
		push: 'hernan';
		push: 'perro'.
	
	^SentenceFinderByPrefix new findElementWithPrefix: '' inStack: stack! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'lastElement size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:07:47'!
decreaseSize

	size := size - 1! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:08:56'!
initialize

	lastElement  := StackBase new.
	size := 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 4/21/2023 21:02:56'!
isEmpty

	^ lastElement isEmpty 
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:06:14'!
pop
	
	^ lastElement pop! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:12:52'!
push: aValue 
	
	| lastStackElement|
	
	lastStackElement := lastElement.
	
	lastElement := StackElement with: aValue withStack: self.
	lastElement setPreviousElement: lastStackElement.
	
	size := size + 1
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 4/21/2023 23:16:54'!
setLastElementOrBase: elementOrBase

	lastElement  := elementOrBase! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:08:10'!
size
	
	^ size! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:04:39'!
top

	"(self size > 0) ifTrue: [^ elements first.] ifFalse: [
		self error: self class stackEmptyErrorDescription ]"
	
	^ lastElement top! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'ma 4/21/2023 19:42:36'!
stackEmptyErrorDescription

	^ 'stack is empty!!!!!!'! !


!classDefinition: #StackBase category: 'Stack-Exercise'!
OOStack subclass: #StackBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackBase methodsFor: 'as yet unclassified' stamp: 'ma 4/21/2023 21:46:43'!
initialize
! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'ma 4/21/2023 21:01:03'!
isEmpty
	
	^ true! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'ma 4/21/2023 21:04:07'!
pop

	self error: self class stackEmptyErrorDescription ! !

!StackBase methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:01:26'!
top

	self error: self class stackEmptyErrorDescription ! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
OOStack subclass: #StackElement
	instanceVariableNames: 'previousElement value stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'as yet unclassified' stamp: 'ma 4/21/2023 21:51:23'!
initialize! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:12:22'!
initializeWith: aValue withStack: aStack
	
	value := aValue.
	stack := aStack ! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'ma 4/21/2023 21:01:13'!
isEmpty

	^ false! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:06:44'!
pop
	
	stack setLastElementOrBase: previousElement.
	stack decreaseSize.
	
	^ value.! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'ma 4/21/2023 20:53:04'!
setPreviousElement: aStackOrBaseElement

	previousElement := aStackOrBaseElement ! !

!StackElement methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:05:04'!
top

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackElement class' category: 'Stack-Exercise'!
StackElement class
	instanceVariableNames: ''!

!StackElement class methodsFor: 'as yet unclassified' stamp: 'ma 4/21/2023 21:55:31'!
with: aValue

	^self new initializeWith: aValue! !

!StackElement class methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:12:52'!
with: aValue withStack: aStack

	^self new initializeWith: aValue withStack: aStack! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:22:15'!
find
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:33:20'!
findElementWithPrefix: aPrefix inStack: aStack

	| xxx |
	
	xxx := OrderedCollection new.
	self findElementWithPrefixAux:  aPrefix inStack:  aStack andStoreItInCollection: xxx.
	
	^ xxx.
	
	
	
	
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'ma 4/22/2023 00:48:15'!
findElementWithPrefixAux: aPrefix inStack: aStack andStoreItInCollection: aCollection

	|currentElement|
	
	(aStack size > 0) ifTrue: [
		currentElement := aStack pop.
		
		(aPrefix = (currentElement copyFrom: 1 to: aPrefix size)) ifTrue: [

			self findElementWithPrefixAux: aPrefix inStack: aStack andStoreItInCollection: aCollection.
			aCollection add: currentElement.
		] ifFalse: [
			self findElementWithPrefixAux: aPrefix inStack: aStack andStoreItInCollection: aCollection.
		].
		
		aStack push: currentElement.
	]
	
	
! !
