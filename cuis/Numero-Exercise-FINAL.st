!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !



!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 20:34:39'!
multiply: aNumber

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:05:01'!
* aMultiplier 
	
	^ aMultiplier multiplyAEntero: self.

	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:13:48'!
+ anAdder 
	
	^ anAdder addAEntero: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:21:53'!
- aSubtrahend 
	
	^ aSubtrahend substractFromEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 22:45:12'!
/ aDivisor 
	
	^ aDivisor divideFromEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:14:31'!
addAEntero: aEnteroAdder 
	
	^self class with: value + aEnteroAdder integerValue
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:06:31'!
addAFraccion: aFraccionAdder 
	
	| newNumerator newDenominator |
			
	newNumerator  := (self * aFraccionAdder denominator) + aFraccionAdder numerator.
	newDenominator := aFraccionAdder denominator.
		
	^aFraccionAdder class with: newNumerator over: newDenominator. 
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 22:35:32'!
divideFromEntero: aDivisorEntero 
	
	^ Fraccion with: aDivisorEntero over: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 22:44:23'!
divideFromFraccion: aDivisorFraccion 
	
	|one|
	one := Entero with: 1.
	
	^ aDivisorFraccion  multiplyAFraccion: (Fraccion with: one over: self).! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 20:54:00'!
multiplyAEntero: aEnteroMultiplier 
	
	^self class with: value * aEnteroMultiplier integerValue. 
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 20:55:03'!
multiplyAFraccion: aFraccionMultiplier 
	
	^aFraccionMultiplier class with: (self * aFraccionMultiplier numerator) over: aFraccionMultiplier denominator. 
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 20:21:13'!
negated

	^self * (self class with: -1)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:17:54'!
substractFromEntero: aEntero
	
	^ (self class with: value - aEntero integerValue) negated. ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:19:06'!
substractFromFraccion: aFraccion 
	
	^ (self addAFraccion: aFraccion negated) negated.! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !



!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'ma 4/19/2023 23:29:12'!
isNegative
	
	^ self subclassResponsibility ! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'ma 4/19/2023 23:46:23'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	(aValue < 0) ifTrue: [^ Negativo new initializeWith: aValue].
	(aValue = 0) ifTrue: [^ Cero new initializeWith: aValue].
	(aValue = 1) ifTrue: [^ Uno new initializeWith: aValue].
	(aValue > 1) ifTrue: [^ MayorQueUno new initializeWith: aValue].! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:33:54'!
fibonacci
	
	^Entero with: 1.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:26:53'!
initializeWith: aValue 
	
	value := aValue! !

!Cero methodsFor: 'as yet unclassified' stamp: 'ma 4/20/2023 01:01:37'!
isNegative

	^ false! !

!Cero methodsFor: 'as yet unclassified' stamp: 'ma 4/20/2023 01:04:35'!
thatDivides: aDividend

	^ self error: Fraccion canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'as yet unclassified' stamp: 'ma 4/20/2023 01:04:58'!
thatIsDividedBy: aDivisor

	^ Entero with: 0.! !


!classDefinition: #MayorQueUno category: 'Numero-Exercise'!
Entero subclass: #MayorQueUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!MayorQueUno methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:35:07'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci! !

!MayorQueUno methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:27:03'!
initializeWith: aValue 
	
	value := aValue! !

!MayorQueUno methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:29:48'!
isNegative
	^ false! !

!MayorQueUno methodsFor: 'as yet unclassified' stamp: 'ma 4/20/2023 01:05:07'!
thatDivides: aDividend

	^ aDividend thatIsDividedBy: self! !

!MayorQueUno methodsFor: 'as yet unclassified' stamp: 'ma 4/20/2023 01:05:15'!
thatIsDividedBy: aDivisor

	^Fraccion coprimesWith: self over: aDivisor.
	! !


!classDefinition: #Negativo category: 'Numero-Exercise'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativo methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:34:43'!
fibonacci

	^self error: Entero negativeFibonacciErrorDescription
	
		! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:27:37'!
initializeWith: aValue 
	
	value := aValue! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:29:57'!
isNegative
	^ true! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'ma 4/20/2023 01:05:25'!
thatDivides: aDividend
	^ (aDividend negated) thatIsDividedBy: self negated! !

!Negativo methodsFor: 'as yet unclassified' stamp: 'ma 4/20/2023 01:05:31'!
thatIsDividedBy: aDivisor

	^Fraccion coprimesWith: self over: aDivisor.! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:34:05'!
fibonacci
	
	^Entero with: 1.! !

!Uno methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:27:43'!
initializeWith: aValue 
	
	value := aValue! !

!Uno methodsFor: 'as yet unclassified' stamp: 'ma 4/19/2023 23:30:08'!
isNegative
	^ false! !

!Uno methodsFor: 'as yet unclassified' stamp: 'ma 4/20/2023 01:05:38'!
thatDivides: aDividend

	^ aDividend. ! !

!Uno methodsFor: 'as yet unclassified' stamp: 'ma 4/20/2023 01:05:44'!
thatIsDividedBy: aDivisor

	^Fraccion coprimesWith: self over: aDivisor. ! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:05:07'!
* aMultiplier 

	^aMultiplier multiplyAFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:13:55'!
+ anAdder 
	
	^ anAdder addAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:21:35'!
- aSubtrahend 
	
	^ aSubtrahend substractFromFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 22:49:09'!
/ aDivisor 

	^ aDivisor  divideFromFraccion:  self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:07:48'!
addAEntero: anAdder 
	
	^ anAdder addAFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:08:18'!
addAFraccion: aFraccionAdder 

	| newNumerator newDenominator |

	newNumerator := (numerator * aFraccionAdder denominator) + (denominator * aFraccionAdder numerator).
	newDenominator := denominator * aFraccionAdder denominator.
	
	^ newNumerator / newDenominator. 
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 22:47:21'!
divideFromEntero: aDivisorEntero 

	^ aDivisorEntero multiplyAFraccion: (Fraccion with: self denominator over: self numerator). ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 22:54:07'!
divideFromFraccion: aDivisorFraccion

	^(aDivisorFraccion numerator multiplyAEntero: self denominator) / (aDivisorFraccion denominator multiplyAEntero: self numerator )! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:00:32'!
multiplyAEntero: aMultiplier 

	^ aMultiplier multiplyAFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 20:55:45'!
multiplyAFraccion: aMultiplier 

	^ (numerator * aMultiplier numerator) / (denominator * aMultiplier denominator). 
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 20:20:19'!
negated

	^self class with: numerator * (Entero with: -1) over: denominator.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:20:17'!
substractFromEntero: aEntero 
	
	^ (self + (aEntero class with: (aEntero integerValue negated))) negated
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ma 4/19/2023 21:20:56'!
substractFromFraccion: aFraccion 
	
	^ (self addAFraccion: aFraccion negated) negated. 
! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'ma 4/20/2023 01:00:24'!
coprimesWith: aDividend over: aDivisor

	^self new initializeWith: aDividend over: aDivisor.
	! !

!Fraccion class methodsFor: 'intance creation' stamp: 'ma 4/20/2023 01:06:00'!
with: aDividend over: aDivisor

	|numerator denominator greatestCommonDivisor|
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor.
	
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	^denominator thatDivides: numerator.
	! !
