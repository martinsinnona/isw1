!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'mc 4/12/2023 21:01:20'!
activeCustomersEquals: active suspendedCustomersEquals: suspended totalCustomersEquals: total inCustomerBook: customerBook
	
	self assert: active equals: customerBook numberOfActiveCustomers.
	self assert: suspended equals: customerBook numberOfSuspendedCustomers.
	self assert: total equals: customerBook numberOfCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mc 4/12/2023 21:14:27'!
checkUniqueCustomerNamed: customer inCustomerBook: customerBook
	
	[ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: customer) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mc 4/12/2023 21:07:50'!
determineTimeElapsedBy: aClosure andCheckLessThan: aNumber

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (aNumber * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mc 4/12/2023 21:07:21'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self determineTimeElapsedBy: [customerBook addCustomerNamed: 'John Lennon'.] andCheckLessThan: 50.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mc 4/12/2023 21:07:21'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed:  'Paul McCartney'.
	
	self determineTimeElapsedBy: [	customerBook removeCustomerNamed: 'Paul McCartney'.
] andCheckLessThan: 100! !

!CustomerBookTest methodsFor: 'testing' stamp: 'sinno 4/11/2023 23:41:22'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self whenDo: [customerBook addCustomerNamed: ''.] thatFailsWithTypeOfError: Error do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'sinno 4/12/2023 00:00:12'!
test04CanNotRemoveAnInvalidCustomer

	| customerBook |
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'JohnLennon'.

	self whenDo: [customerBook removeCustomerNamed: 'Paul McCartney'.] thatFailsWithTypeOfError: NotFound do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'JohnLennon' )]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mc 4/12/2023 21:01:20'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self activeCustomersEquals: 0 suspendedCustomersEquals: 1 totalCustomersEquals: 1 inCustomerBook: customerBook.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mc 4/12/2023 21:01:20'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self activeCustomersEquals: 0 suspendedCustomersEquals: 0 totalCustomersEquals: 0 inCustomerBook: customerBook.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mc 4/12/2023 21:14:27'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self whenDo: [customerBook suspendCustomerNamed: 'George Harrison'.] thatFailsWithTypeOfError: CantSuspend do: [self checkUniqueCustomerNamed: johnLennon inCustomerBook: customerBook]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'mc 4/12/2023 21:14:27'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self whenDo: [ customerBook suspendCustomerNamed: johnLennon.
	self fail ] thatFailsWithTypeOfError: CantSuspend do: [self checkUniqueCustomerNamed: johnLennon inCustomerBook: customerBook]
		
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'sinno 4/11/2023 23:46:51'!
whenDo: aClosure thatFailsWithTypeOfError: typeOfError do: anErrorClosure

	[aClosure value
	self fail ]
		on: typeOfError 
		do: anErrorClosure! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'mc 4/12/2023 17:25:58'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'mc 4/12/2023 20:56:06'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'mc 4/12/2023 23:46:59'!
removeCustomerNamed: aName 
	
	^active remove: aName ifAbsent: [ ^suspended remove: aName ifAbsent: [^ NotFound signal.].].

! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:52'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/9/2023 22:25:56'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
