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

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 18:08:47'!
compareStack: aStack withStack: anotherStack

	|currentElementFirstStack currentElementSecondStack|

	(aStack size = anotherStack size) ifTrue: [
		
		aStack size timesRepeat: [
			
			currentElementFirstStack := aStack pop.
			currentElementSecondStack := anotherStack pop.
			
			^ currentElementFirstStack  ~= currentElementSecondStack

		].
	
		^true.
	]
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 17:47:42'!
test01FindIsCaseSensitive

    | stack modelResult |
    
    stack := OOStack new.
    stack 
        push: 'hello';
        push: 'Hi'.
        
    modelResult := OrderedCollection new.
    modelResult add: 'hello'.
            
    self assert: (SentenceFinderByPrefix new findElementWithPrefix: 'h' inStack: stack) = modelResult.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 17:54:35'!
test02FindReturnInCorrectOrder

	| stack modelResult |
    
	stack := OOStack new.
	modelResult := OrderedCollection new.
	modelResult 
		add: 'doctor';
		add: 'dog'.
		
	stack push: 'dog';
    		 push: 'cat';
    		 push: 'doctor'.
	
	self assert: (SentenceFinderByPrefix new findElementWithPrefix: 'do' inStack: stack) = modelResult.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 17:57:05'!
test03FindReturnsCorrectly

	    | stack modelResult |
    
    stack := OOStack new.
    modelResult := OrderedCollection new.
    modelResult 
            add: 'doctor is working'.
    stack 
        push: 'dog is walking';
        push: 'cat is eating';
        push: 'doctor is working';
        push: 'Document is easy'.
            
    self assert: (SentenceFinderByPrefix new findElementWithPrefix: 'doc' inStack: stack) = modelResult.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 17:57:31'!
test04FindReturnsEmptyCollectionWithEmptyStack

    | stack modelResult |
    
    stack := OOStack new.
    modelResult := OrderedCollection new.
        
    self assert: (SentenceFinderByPrefix new findElementWithPrefix: 'doc' inStack: stack) = modelResult .! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 18:00:47'!
test05FindDoesNotModifyStack

	| stack modelResult stackCopy|
    
	stack := OOStack new.
	stackCopy := OOStack new.

	modelResult := OrderedCollection new.
	modelResult add: 'hello'.
	stack 
		push: 'hello';
		push: 'Hi'.
        
	stackCopy
		push: 'hello';
		push: 'Hi'.    
        
   self compareStack: stackCopy withStack: stack! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 19:00:55'!
test06CanNotFindIfPrefixIsEmpty

	| stack |
    
	stack := OOStack new.
	stack 
		push: 'hello';
		push: 'Hi'.
		
	self 
		should: [SentenceFinderByPrefix new findElementWithPrefix: '' inStack: stack]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription]
  ! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 19:04:33'!
test07CanNotFindIfPrefixHasWhitespaces

	| stack |
    
	stack := OOStack new.
	stack 
		push: 'hello';
		push: 'Hi'.
		
	self 
		should: [SentenceFinderByPrefix new findElementWithPrefix: 'he llo' inStack: stack]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixContainsWithespaceErrorDescription]

  ! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/24/2023 08:55:47'!
test08FindDoNotFindAnything

	    | stack modelResult |
    
    stack := OOStack new.
    modelResult := OrderedCollection new.
    stack 
        push: 'dog is walking';
        push: 'cat is eating';
        push: 'doctor is working';
        push: 'Document is easy'.
            
    self assert: (SentenceFinderByPrefix new findElementWithPrefix: 'al' inStack: stack) = modelResult.! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'ma 4/24/2023 09:01:03'!
test09FindEverything

	    | stack modelResult |
    
	stack := OOStack new.
	modelResult := OrderedCollection new.
	
	modelResult 
		add: 'document is easy';
		add: 'doctor is working';
		add: 'dog is walking'.


	stack 
		push: 'dog is walking';
		push: 'doctor is working';
		push: 'document is easy'.
            
    self assert: (SentenceFinderByPrefix new findElementWithPrefix: 'do' inStack: stack) = modelResult.! !


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

!StackElement methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 17:37:49'!
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

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 19:03:29'!
aPrefixDoNotContainsWhitespaces: aPrefix

	aPrefix detect: [:char| char isSeparator] ifNone: [^ true].
	self error: self class prefixContainsWithespaceErrorDescription.
! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 19:00:21'!
findElementWithPrefix: aPrefix inStack: aStack

	|currentElement aCollection elementsPoped|
	
	(aPrefix = '') ifTrue: [self error: self class prefixEmptyErrorDescription].
	self aPrefixDoNotContainsWhitespaces: aPrefix.
    
	aCollection := OrderedCollection new.
	elementsPoped := OrderedCollection new.
    
	aStack size timesRepeat: [
         
		currentElement := aStack pop.
		elementsPoped add: currentElement.
		
		(aPrefix = (currentElement copyFrom: 1 to: aPrefix size)) ifTrue: [
			aCollection addLast: currentElement.
		].

	].

	elementsPoped size timesRepeat: [
		aStack push: elementsPoped first.
		elementsPoped removeFirst.
	].

	^ aCollection.
	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 19:03:06'!
prefixContainsWithespaceErrorDescription

	^'The prefix contains a whitespace'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'ma 4/23/2023 18:42:03'!
prefixEmptyErrorDescription

	^'prefix is empty'! !
