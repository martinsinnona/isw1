!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 18:17:38'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 


	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 18:17:44'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 18:17:21'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 18:17:52'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 18:18:06'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 18:18:12'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 18:18:20'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 18:14:35'!
test08EmptyPorfolioHasZeroBalance 

	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:20:12'!
test09PorfolioBalanceWithSingleAccountWithoutTransactions

	|portfolio account|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	portfolio register: account.
	
	self assert: account balance equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:20:17'!
test10PorfolioBalanceWithSingleAccount

	|portfolio account|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portfolio register: account.
	
	self assert: account balance equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:20:21'!
test11PorfolioBalanceWithDoubleAccount

	|portfolio firstAccount secondAccount|
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	Deposit register: 100 on: firstAccount.
	
	portfolio register: firstAccount.
	portfolio register: secondAccount.
	
	self assert: (firstAccount balance + secondAccount balance)  equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:20:26'!
test12PorfolioBalanceWithDoubleAccountWithDepositOnSecondOne

	|portfolio firstAccount secondAccount|
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	Deposit register: 100 on: secondAccount.
	
	portfolio register: firstAccount.
	portfolio register: secondAccount.
	
	self assert: (firstAccount balance + secondAccount balance)  equals: portfolio balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 18:39:16'!
test13PorfolioTransactionsWithoutAccounts

	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: OrderedCollection new equals: portfolio transactions.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:20:30'!
test14PorfolioTransactionsWithSingleAccount

	|portfolio account|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portfolio register: account.
	
	self assert: (account transactions) equals: portfolio transactions.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:20:36'!
test15PorfolioTransactionsWithDoubleAccount

	|portfolio firstAccount secondAccount accountsTransactions|
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	Deposit register: 100 on: secondAccount.
	
	portfolio register: firstAccount.
	portfolio register: secondAccount.
	
	accountsTransactions :=  (firstAccount transactions addAll: secondAccount transactions; yourself).
	
	self assert: accountsTransactions equals: portfolio transactions.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:20:39'!
test16PortfolioHasRegisteredTransaction

	|portfolio account deposit|
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	
	portfolio register: account.
	
	self assert: true equals: (portfolio hasRegistered: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:20:42'!
test17PortfolioHasNotRegisteredTransaction

	|portfolio firstAccount secondAccount deposit|
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	deposit := Deposit register: 100 on: firstAccount.
	
	portfolio register: secondAccount.
	
	self assert: false equals: (portfolio hasRegistered: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:19:46'!
test18PortfolioBalanceWithPortfolioInside

	|portfolio innerPortfolio|
	
	portfolio := Portfolio new.
	innerPortfolio := Portfolio new.
	
	portfolio register: innerPortfolio.
	
	self assert: 0 equals: (portfolio balance).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 19:20:00'!
test19PortfolioBalanceWithInnerPortfolioWithAccount

	|portfolio innerPortfolio account|
	
	portfolio := Portfolio new.
	innerPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	innerPortfolio register: account .
	Deposit register: 200 on: account .
	portfolio register: innerPortfolio.
	
	self assert: 200 equals: (portfolio balance).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 20:18:59'!
test20PortfolioBalanceWithAccountAndInnerPortfolioWithAccount

	|portfolio innerPortfolio innerAccount account|
	
	portfolio := Portfolio new.
	innerPortfolio := Portfolio new.
	
	innerAccount := ReceptiveAccount new. 
	account := ReceptiveAccount new.
	
	innerPortfolio register: innerAccount .
	Deposit register: 200 on: innerAccount .
	Deposit register: 100 on: account .
	
	portfolio register: innerPortfolio.
	portfolio register: account.
	
	self assert: 300 equals: (portfolio balance).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/21/2023 20:40:50'!
test21PortfolioHasRepeteadAccount

	|portfolio firstAccount|
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new. 
	
	portfolio register: firstAccount.
	
	self should: [portfolio register: firstAccount]
		raise: Error
		withExceptionDo: [:unError |
			self assert: Portfolio accountAlreadyExistsErrorDescription equals: unError messageText.].
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/22/2023 00:16:08'!
test22PortfolioTreeAddAccount

	|portfolio innerPortfolio firstAccount|
	
	portfolio := Portfolio new.
	innerPortfolio := Portfolio new.
	
	firstAccount := ReceptiveAccount new. 
	
	portfolio register: firstAccount.    
	portfolio register: innerPortfolio .
	
	self should: [innerPortfolio register: firstAccount ]
		raise: Error
		withExceptionDo: [:unError |
			self assert: Portfolio accountAlreadyExistsErrorDescription equals: unError messageText.].
		
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'ma 5/22/2023 00:15:59'!
test23PortfolioWithPortfolioInsideHasRepeteadAccount

	|portfolio firstAccount innerPortfolio|
	
	portfolio := Portfolio new.
	innerPortfolio := Portfolio new.
	
	firstAccount := ReceptiveAccount new. 
	
	innerPortfolio register: firstAccount .    
	portfolio register: firstAccount.
	
	self should: [portfolio register: innerPortfolio ]
		raise: Error
		withExceptionDo: [:unError |
			self assert: Portfolio accountAlreadyExistsErrorDescription equals: unError messageText.].
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'ma 5/15/2023 20:20:39'!
modifyBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'ma 5/21/2023 18:37:42'!
initializeFor: aValue

	value := aValue.! !


!Deposit methodsFor: 'value' stamp: 'ma 5/15/2023 20:20:05'!
modifyBalance: aBalance

	^aBalance + self value.! !

!Deposit methodsFor: 'value' stamp: 'ma 5/21/2023 18:37:54'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'ma 5/15/2023 20:04:15'!
initializeFor: aValue

	value := aValue.
! !


!Withdraw methodsFor: 'value' stamp: 'ma 5/15/2023 20:20:21'!
modifyBalance: aBalance

	^aBalance - self value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accountsAndPortfolios upperPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'assertions' stamp: 'ma 5/22/2023 00:46:50'!
assertDoesNotContainRepeated: accountOrPorfolio 
	
	| allAccounts |
	
	allAccounts := OrderedCollection new.
	
	self allPortfoliosRoots do: [ :root | allAccounts addAll: (root allAccounts); yourself].
	(allAccounts intersection: accountOrPorfolio allAccounts) isEmpty ifFalse: [self error: Portfolio accountAlreadyExistsErrorDescription ].

	
	! !


!Portfolio methodsFor: 'initialization' stamp: 'ma 5/21/2023 23:00:00'!
initialize

	accountsAndPortfolios := OrderedCollection new.
	upperPortfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'registration' stamp: 'ma 5/22/2023 00:47:46'!
hasRegistered: aTransaction 

	 ^ self transactions includes: aTransaction.! !

!Portfolio methodsFor: 'registration' stamp: 'ma 5/22/2023 00:48:05'!
register: accountOrPorfolio 
	
	self assertDoesNotContainRepeated: accountOrPorfolio.
	accountOrPorfolio registerOn: self.
! !

!Portfolio methodsFor: 'registration' stamp: 'ma 5/22/2023 00:48:15'!
registerAccountOrPortfolio: accountOrPorfolio 
	
	accountsAndPortfolios add: accountOrPorfolio.! !

!Portfolio methodsFor: 'registration' stamp: 'ma 5/21/2023 23:01:30'!
registerOn: aPortfolio 
	
	upperPortfolios add: aPortfolio.
	aPortfolio registerAccountOrPortfolio: self! !


!Portfolio methodsFor: 'access' stamp: 'ma 5/22/2023 00:47:10'!
allAccounts
	
	| allAccounts|
	allAccounts := OrderedCollection new.
	
	accountsAndPortfolios do: [:accountOrPortfolio | allAccounts addAll: accountOrPortfolio allAccounts; yourself].
	
	^ allAccounts! !

!Portfolio methodsFor: 'access' stamp: 'ma 5/22/2023 00:45:28'!
allPortfoliosRoots
	
	| allRoots|
	allRoots := OrderedCollection new.
	
	upperPortfolios isEmpty ifTrue: [allRoots add: self].
	upperPortfolios do: [:portfolio | allRoots addAll: portfolio allPortfoliosRoots; yourself.].
	
	^ allRoots! !

!Portfolio methodsFor: 'access' stamp: 'ma 5/22/2023 00:49:28'!
transactions

	|transactions|
	
	transactions := OrderedCollection new.
	
	accountsAndPortfolios isEmpty ifTrue: [
		^OrderedCollection new.
	] ifFalse: [
		accountsAndPortfolios do: [:anAccount | transactions addAll: anAccount transactions; yourself] 
	].
	
	^transactions .! !


!Portfolio methodsFor: 'balance' stamp: 'ma 5/22/2023 00:47:37'!
balance

	^ accountsAndPortfolios sum: [ :anAccount | anAccount balance] ifEmpty: [^0]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'ma 5/21/2023 20:36:56'!
accountAlreadyExistsErrorDescription

	^ 'the account already exists'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions upperPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'ma 5/21/2023 18:37:23'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'ma 5/21/2023 18:38:24'!
register: aTransaction

	transactions add: aTransaction ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'ma 5/21/2023 18:54:18'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'ma 5/21/2023 18:11:18'!
balance

	|total|
	total := 0.
	
	transactions do: [:aTransaction | total := aTransaction modifyBalance: total].
	
	^total.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'ma 5/21/2023 18:38:09'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'registration' stamp: 'ma 5/21/2023 23:21:47'!
registerOn: aPortfolio 
	
	upperPortfolio := aPortfolio.
	aPortfolio registerAccountOrPortfolio: self! !


!ReceptiveAccount methodsFor: 'access' stamp: 'ma 5/22/2023 00:37:25'!
allAccounts

	^(OrderedCollection new) add: self; yourself

	! !
