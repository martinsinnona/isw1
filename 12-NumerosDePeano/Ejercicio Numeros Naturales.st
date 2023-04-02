!classDefinition: #I category: 'Ejercicio Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Ejercicio Numeros Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'private' stamp: 'JFGO 3/25/2023 19:00:37'!
next
	^II.! !

!I class methodsFor: 'private' stamp: 'JFGO 3/25/2023 19:59:30'!
subtractFrom: aNaturalNumber
	^aNaturalNumber previous.! !


!I class methodsFor: 'arithmetic operations' stamp: 'JFGO 3/25/2023 19:13:50'!
+ aNaturalNumber
	^aNaturalNumber next.! !


!I class methodsFor: 'as yet unclassified' stamp: 'sinno 3/28/2023 23:16:06'!
* aNumber
	^aNumber
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'sinno 3/30/2023 10:28:04'!
- aNumber
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'as yet unclassified' stamp: 'sinno 3/30/2023 10:12:08'!
/ aNumber
	^(aNumber divideTo: self)! !

!I class methodsFor: 'as yet unclassified' stamp: 'sinno 3/28/2023 23:56:45'!
> aNumber
	^false! !

!I class methodsFor: 'as yet unclassified' stamp: 'sinno 3/29/2023 12:31:54'!
>= aNumber
	^(aNumber = 1)! !

!I class methodsFor: 'as yet unclassified' stamp: 'sinno 3/30/2023 10:28:04'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^ 'No se puede restar al número I'! !

!I class methodsFor: 'as yet unclassified' stamp: 'sinno 3/29/2023 13:19:21'!
divideTo: aNumber
	^aNumber! !


!classDefinition: #II category: 'Ejercicio Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Ejercicio Numeros Naturales'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'arithmetic operations' stamp: 'JFGO 3/25/2023 19:27:09'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!II class methodsFor: 'arithmetic operations' stamp: 'sinno 3/28/2023 23:10:08'!
- aNaturalNumber
	^aNaturalNumber subtractFrom: self! !

!II class methodsFor: 'arithmetic operations' stamp: 'sinno 3/29/2023 13:26:46'!
"/ aNumber
	(aNumber = I) ifTrue: [^self].
	(self = aNumber) ifTrue: [^I].
	((self > (II*aNumber)) or: (self = (II*aNumber))) ifTrue: [^(I + (self - aNumber / aNumber))] ifFalse: [^I]"
	
/ aNumber
	^(aNumber divideTo: self)! !


!II class methodsFor: 'private' stamp: 'sinno 3/28/2023 23:19:26'!
* aNumber
	^ aNumber + (self previous * aNumber)! !

!II class methodsFor: 'private' stamp: 'sinno 3/28/2023 23:56:53'!
> aNumber
	(aNumber next = self) ifTrue: [^true] ifFalse: [^(self previous > aNumber)]! !

!II class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:31:36'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un número mas grande'! !

!II class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:31:36'!
divideTo: aNumber
	(self > aNumber) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	(self = aNumber) ifTrue: [^I].
	((aNumber - self) >= self) ifTrue: [^(I + (self divideTo: aNumber - self))] ifFalse: [^I].! !

!II class methodsFor: 'private' stamp: 'JFGO 3/26/2023 11:19:10'!
next
	next ifNil: [
		next := self cloneNamed: self name, 'I'. 
		next previous: self.		
		].
	
	^next.! !

!II class methodsFor: 'private' stamp: 'JFGO 3/25/2023 19:25:46'!
previous
	^previous.! !

!II class methodsFor: 'private' stamp: 'JFGO 3/25/2023 19:36:52'!
previous: aNaturalNumber
	previous:=aNaturalNumber.! !

!II class methodsFor: 'private' stamp: 'JFGO 3/25/2023 20:54:19'!
subtractFrom: aNaturalNumber
	^aNaturalNumber previous - self previous.! !


!II class methodsFor: 'as yet unclassified' stamp: 'sinno 3/29/2023 12:30:52'!
>= aNumber
	^((self = aNumber) or: (self > aNumber))! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'sinno 3/30/2023 10:35:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Ejercicio Numeros Naturales'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Ejercicio Numeros Naturales'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'arithmetic operations' stamp: 'sinno 3/30/2023 10:33:21'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!III class methodsFor: 'arithmetic operations' stamp: 'sinno 3/30/2023 10:33:21'!
- aNaturalNumber
	^aNaturalNumber subtractFrom: self! !

!III class methodsFor: 'arithmetic operations' stamp: 'sinno 3/30/2023 10:33:22'!
"/ aNumber
	(aNumber = I) ifTrue: [^self].
	(self = aNumber) ifTrue: [^I].
	((self > (II*aNumber)) or: (self = (II*aNumber))) ifTrue: [^(I + (self - aNumber / aNumber))] ifFalse: [^I]"
	
/ aNumber
	^(aNumber divideTo: self)! !


!III class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:22'!
* aNumber
	^ aNumber + (self previous * aNumber)! !

!III class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:22'!
> aNumber
	(aNumber next = self) ifTrue: [^true] ifFalse: [^(self previous > aNumber)]! !

!III class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:22'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un número mas grande'! !

!III class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:22'!
divideTo: aNumber
	(self > aNumber) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	(self = aNumber) ifTrue: [^I].
	((aNumber - self) >= self) ifTrue: [^(I + (self divideTo: aNumber - self))] ifFalse: [^I].! !

!III class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:22'!
next
	next ifNil: [
		next := self cloneNamed: self name, 'I'. 
		next previous: self.		
		].
	
	^next.! !

!III class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:22'!
previous
	^previous.! !

!III class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:22'!
previous: aNaturalNumber
	previous:=aNaturalNumber.! !

!III class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:22'!
subtractFrom: aNaturalNumber
	^aNaturalNumber previous - self previous.! !


!III class methodsFor: 'as yet unclassified' stamp: 'sinno 3/30/2023 10:33:22'!
>= aNumber
	^((self = aNumber) or: (self > aNumber))! !


!III class methodsFor: '--** private fileout/in **--' stamp: 'sinno 3/30/2023 10:35:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Ejercicio Numeros Naturales'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Ejercicio Numeros Naturales'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'arithmetic operations' stamp: 'sinno 3/30/2023 10:33:25'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIII class methodsFor: 'arithmetic operations' stamp: 'sinno 3/30/2023 10:33:26'!
- aNaturalNumber
	^aNaturalNumber subtractFrom: self! !

!IIII class methodsFor: 'arithmetic operations' stamp: 'sinno 3/30/2023 10:33:26'!
"/ aNumber
	(aNumber = I) ifTrue: [^self].
	(self = aNumber) ifTrue: [^I].
	((self > (II*aNumber)) or: (self = (II*aNumber))) ifTrue: [^(I + (self - aNumber / aNumber))] ifFalse: [^I]"
	
/ aNumber
	^(aNumber divideTo: self)! !


!IIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:26'!
* aNumber
	^ aNumber + (self previous * aNumber)! !

!IIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:26'!
> aNumber
	(aNumber next = self) ifTrue: [^true] ifFalse: [^(self previous > aNumber)]! !

!IIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:26'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un número mas grande'! !

!IIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:26'!
divideTo: aNumber
	(self > aNumber) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	(self = aNumber) ifTrue: [^I].
	((aNumber - self) >= self) ifTrue: [^(I + (self divideTo: aNumber - self))] ifFalse: [^I].! !

!IIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:26'!
next
	next ifNil: [
		next := self cloneNamed: self name, 'I'. 
		next previous: self.		
		].
	
	^next.! !

!IIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:26'!
previous
	^previous.! !

!IIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:26'!
previous: aNaturalNumber
	previous:=aNaturalNumber.! !

!IIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:33:26'!
subtractFrom: aNaturalNumber
	^aNaturalNumber previous - self previous.! !


!IIII class methodsFor: 'as yet unclassified' stamp: 'sinno 3/30/2023 10:33:26'!
>= aNumber
	^((self = aNumber) or: (self > aNumber))! !


!IIII class methodsFor: '--** private fileout/in **--' stamp: 'sinno 3/30/2023 10:35:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: 'Ejercicio Numeros Naturales'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Ejercicio Numeros Naturales'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'arithmetic operations' stamp: 'sinno 3/30/2023 10:34:13'!
+ aNaturalNumber
	^self previous + aNaturalNumber next.! !

!IIIII class methodsFor: 'arithmetic operations' stamp: 'sinno 3/30/2023 10:34:14'!
- aNaturalNumber
	^aNaturalNumber subtractFrom: self! !

!IIIII class methodsFor: 'arithmetic operations' stamp: 'sinno 3/30/2023 10:34:14'!
"/ aNumber
	(aNumber = I) ifTrue: [^self].
	(self = aNumber) ifTrue: [^I].
	((self > (II*aNumber)) or: (self = (II*aNumber))) ifTrue: [^(I + (self - aNumber / aNumber))] ifFalse: [^I]"
	
/ aNumber
	^(aNumber divideTo: self)! !


!IIIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:34:14'!
* aNumber
	^ aNumber + (self previous * aNumber)! !

!IIIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:34:14'!
> aNumber
	(aNumber next = self) ifTrue: [^true] ifFalse: [^(self previous > aNumber)]! !

!IIIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:34:14'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un número mas grande'! !

!IIIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:34:14'!
divideTo: aNumber
	(self > aNumber) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	(self = aNumber) ifTrue: [^I].
	((aNumber - self) >= self) ifTrue: [^(I + (self divideTo: aNumber - self))] ifFalse: [^I].! !

!IIIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:34:14'!
next
	next ifNil: [
		next := self cloneNamed: self name, 'I'. 
		next previous: self.		
		].
	
	^next.! !

!IIIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:34:14'!
previous
	^previous.! !

!IIIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:34:14'!
previous: aNaturalNumber
	previous:=aNaturalNumber.! !

!IIIII class methodsFor: 'private' stamp: 'sinno 3/30/2023 10:34:14'!
subtractFrom: aNaturalNumber
	^aNaturalNumber previous - self previous.! !


!IIIII class methodsFor: 'as yet unclassified' stamp: 'sinno 3/30/2023 10:34:14'!
>= aNumber
	^((self = aNumber) or: (self > aNumber))! !


!IIIII class methodsFor: '--** private fileout/in **--' stamp: 'sinno 3/30/2023 10:35:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIII.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!