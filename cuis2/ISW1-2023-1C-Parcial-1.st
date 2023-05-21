!classDefinition: #TestDePerforación category: 'ISW1-2023-1C-Parcial-1'!
TestCase subclass: #TestDePerforación
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:29:39'!
assertCapasContiguasDaErrorEnUnSuelo: sueloAExcavar

	^ self should: [Perforadora sobreSuelo: sueloAExcavar.]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'No puede haber dos capas contiguas idénticas'
		 	equals: unError messageText.]! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:02:06'!
assertConteoDeCapasDeTipo: unTipoDeCapa ConExcavadora: excavadora Da: unConteoDeCapas

	self assert: unConteoDeCapas equals: (excavadora contarCapas: unTipoDeCapa)! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 20:55:13'!
assertDarGolpeDeTaladroConExcavadora: excavadora rompeMechaYdaErrorConMensaje: unMensajeDeError 

	self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: unMensajeDeError equals: unError messageText.].
	
	self assert: excavadora conMechaRota.
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:31:42'!
assertProfundidadHastaTipoDeSuelo: unTipoDeSuelo ConExcavadora: unaExcavadora Da: unaProfundidad

	self assert: unaProfundidad equals: (unaExcavadora calcularProfundidadDelSueloHasta: unTipoDeSuelo).! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:06:46'!
assertSinMechaNoSePuedePerforarYDaErrorUsandoExcavadora: excavadora

	^ self should: [excavadora darGolpeDeTaladro]
		raise: Error
		withExceptionDo: [:unError |
			self assert: 'No puede perforar' equals: unError messageText.
			self assert: (CapaDeSuelo arenoso) equals: excavadora capaDeSueloInmediata ]! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:04:51'!
sueloCon2DeArenoso40DeTierra1DeArenosoY1DeConcreto

	^ { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso. CapaDeSuelo concretoConResistencia: 10 }! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 20:13:09'!
test01CuandoExcavaSueloArenosoConMechaSoftRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 20:48:36'!
test02CuandoExcavaSueloTierraConMechaSoftNoModificaElSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 20:54:46'!
test03CuandoExcavaConcretoConMechaSoftSeRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	
	self assertDarGolpeDeTaladroConExcavadora: excavadora rompeMechaYdaErrorConMensaje: 'Se rompió'.
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:05'!
test04CuandoExcavaSueloArenosoConMechaWidiaRemueveCapaArenosa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	
	self assert: CapaDeSuelo tierra equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'ARM 5/5/2023 17:59:09'!
test05CuandoExcavaSueloTierraConMechaWidiaEnDosImpactosTransformaLaCapaEnArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: CapaDeSuelo arenoso equals: excavadora capaDeSueloInmediata
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:05:34'!
test06CuandoExcavaSueloConcretoConMechaWidiaEnTresImpactosRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.	
			CapaDeSuelo tierra.
	}.
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaWidia.
	
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assertDarGolpeDeTaladroConExcavadora: excavadora rompeMechaYdaErrorConMensaje: 'Se rompió'.
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 20:55:45'!
test07CuandoExcavaSueloArenosoConMechaDiamanteRompeLaMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	
	self assertDarGolpeDeTaladroConExcavadora: excavadora rompeMechaYdaErrorConMensaje: 'Se rompió'.
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:05:44'!
test08CuandoExcavaSueloTierraConMechaDiamanteRemueveCapa

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	excavadora darGolpeDeTaladro.
	
	self assert: (CapaDeSuelo concretoConResistencia: 5) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:07:23'!
test09CuandoExcavaSueloConcretoConMechaDiamanteBajaUnDecimoDeResistencia

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaDiamante.
	excavadora darGolpeDeTaladro.
	excavadora darGolpeDeTaladro.	
	
	self assert: (CapaDeSuelo concretoConResistencia: 4) equals: excavadora capaDeSueloInmediata

	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:07:17'!
test10CuandoRemueveLaCapaYHayPiedrasLasRecolectaEnSuContainer

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			'Mica'.
			'Marmol'
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	excavadora darGolpeDeTaladro.
	
	self assert: {	'Mica'. 'Marmol'} equals: excavadora elementsInContainer
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:06:12'!
test11CuandoRemueveLaCapaYNoHayNadaNoRecogeNada

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	excavadora ponerMechaSoft.
	excavadora darGolpeDeTaladro.
	
	self assert: excavadora elementsInContainer isEmpty
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:06:46'!
test12NoPuedePerforarSinMecha

	| excavadora sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			} .
	
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
		
	self assertSinMechaNoSePuedePerforarYDaErrorUsandoExcavadora: excavadora.	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'FRT 5/5/2023 16:46:32'!
test13PuedeCalcularProfundidadDelSuelo

	| excavadora sueloAExcavar |
	
	sueloAExcavar := { CapaDeSuelo arenoso setAltura: 2. CapaDeSuelo tierra setAltura: 40. CapaDeSuelo arenoso} .
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assert: 42 equals: excavadora calcularProfundidadDelSuelo.

	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:04:51'!
test14PuedeContarLasCapasDeTipoArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloCon2DeArenoso40DeTierra1DeArenosoY1DeConcreto.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assertConteoDeCapasDeTipo: Arenoso ConExcavadora: excavadora Da: 2

	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:04:51'!
test15PuedeContarLasCapasDeTipoTierra

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloCon2DeArenoso40DeTierra1DeArenosoY1DeConcreto.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assertConteoDeCapasDeTipo: Tierra ConExcavadora: excavadora Da: 1

	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:04:51'!
test16PuedeContarLasCapasDeTipoConcreto

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloCon2DeArenoso40DeTierra1DeArenosoY1DeConcreto.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assertConteoDeCapasDeTipo: Concreto ConExcavadora: excavadora Da: 1

	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:32:56'!
test17PuedeCalcularProfundidadHastaPrimerCapaDeTipoArenoso

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloCon2DeArenoso40DeTierra1DeArenosoY1DeConcreto.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assertProfundidadHastaTipoDeSuelo: Arenoso ConExcavadora: excavadora Da: 0

	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:32:39'!
test18PuedeCalcularProfundidadHastaPrimerCapaDeTipoTierra

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloCon2DeArenoso40DeTierra1DeArenosoY1DeConcreto.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assertProfundidadHastaTipoDeSuelo: Tierra ConExcavadora: excavadora Da: 2

	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:32:22'!
test19PuedeCalcularProfundidadHastaPrimerCapaDeTipoConcreto

	| excavadora sueloAExcavar |
	
	sueloAExcavar := self sueloCon2DeArenoso40DeTierra1DeArenosoY1DeConcreto.
	excavadora := Perforadora sobreSuelo: sueloAExcavar.
	
	self assertProfundidadHastaTipoDeSuelo: Concreto ConExcavadora: excavadora Da: 42

	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:29:39'!
test20DobleCapaArenosaAlPrincipioCausaError

	| sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo arenoso.
			CapaDeSuelo concretoConResistencia: 5 } .
	
	self assertCapasContiguasDaErrorEnUnSuelo: sueloAExcavar.	
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:29:39'!
test21DobleCapaDeTierraAlFinalCausaError

	| sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.
			CapaDeSuelo tierra. } .
	
	self assertCapasContiguasDaErrorEnUnSuelo: sueloAExcavar.	
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:29:39'!
test22TripleCapaDeTierraAlMedioCausaError

	| sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo tierra.
			CapaDeSuelo concretoConResistencia: 5.
			CapaDeSuelo tierra.
			CapaDeSuelo tierra.
			CapaDeSuelo tierra. 
			CapaDeSuelo arenoso.} .
	
	self assertCapasContiguasDaErrorEnUnSuelo: sueloAExcavar.	
	
	! !

!TestDePerforación methodsFor: 'test' stamp: 'sm 5/8/2023 21:29:39'!
test23DobleCapaArenosaAlPrincipioCausaError

	| sueloAExcavar |
	
	sueloAExcavar := {
			CapaDeSuelo arenoso.
			CapaDeSuelo arenoso.} .
	
	self assertCapasContiguasDaErrorEnUnSuelo: sueloAExcavar.	
	
	! !


!classDefinition: #CapaDeSuelo category: 'ISW1-2023-1C-Parcial-1'!
Object subclass: #CapaDeSuelo
	instanceVariableNames: 'resistencia altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!CapaDeSuelo methodsFor: 'initialization' stamp: 'sm 5/8/2023 18:49:53'!
initialize

	altura := 0! !

!CapaDeSuelo methodsFor: 'initialization' stamp: 'sm 5/8/2023 19:59:43'!
initializeConcretoConResistencia: resistenciaInicial 
	
	resistencia := resistenciaInicial.! !


!CapaDeSuelo methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:35:40'!
esArenoso
	
	self subclassResponsibility ! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:37:45'!
esConcreto
	
	self subclassResponsibility ! !

!CapaDeSuelo methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:38:29'!
esTierra
	
	self subclassResponsibility ! !


!CapaDeSuelo methodsFor: 'comparing' stamp: 'sm 5/8/2023 19:58:52'!
= unaCapaDeSuelo

	^(unaCapaDeSuelo isKindOf: self class) and: [ resistencia = unaCapaDeSuelo resistencia]! !

!CapaDeSuelo methodsFor: 'comparing' stamp: 'sm 5/8/2023 19:59:06'!
hash

	^ resistencia hash! !


!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
bajaUnDecimoDeResistencia
	resistencia := resistencia - 1! !

!CapaDeSuelo methodsFor: 'bajar resistencia' stamp: 'ARM 5/8/2023 13:10:22'!
sinResistencia
	^resistencia = 0! !


!CapaDeSuelo methodsFor: 'accessing' stamp: 'FRT 5/5/2023 16:48:52'!
altura

	^ altura.! !

!CapaDeSuelo methodsFor: 'accessing' stamp: 'ARM 5/8/2023 13:10:35'!
resistencia

	^ resistencia.! !


!CapaDeSuelo methodsFor: 'scan' stamp: 'sm 5/8/2023 19:52:04'!
scan 

	^ self class scan! !


!CapaDeSuelo methodsFor: 'setters' stamp: 'FRT 5/5/2023 16:07:55'!
setAltura: unaAltura

	altura := unaAltura! !


!CapaDeSuelo methodsFor: 'excavacion' stamp: 'sm 5/8/2023 18:34:01'!
taladrarseConPerforadora: aPerforadora 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CapaDeSuelo class' category: 'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo class
	instanceVariableNames: ''!

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'sm 5/8/2023 20:00:05'!
arenoso

	^Arenoso new! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'sm 5/8/2023 18:49:22'!
concretoConResistencia: resistencia 

	^Concreto new initializeConcretoConResistencia: resistencia ! !

!CapaDeSuelo class methodsFor: 'instance creation' stamp: 'sm 5/8/2023 20:00:40'!
tierra

	^Tierra new! !


!CapaDeSuelo class methodsFor: 'scan' stamp: 'sm 5/8/2023 19:51:35'!
scan

	self subclassResponsibility 
	! !


!CapaDeSuelo class methodsFor: 'as yet unclassified' stamp: 'sm 5/8/2023 19:54:47'!
mismoScanQueCapa: unaCapa

	^ self scan = unaCapa scan! !


!classDefinition: #Arenoso category: 'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #Arenoso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!


!Arenoso methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:37:24'!
esArenoso

	^ true! !

!Arenoso methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:37:57'!
esConcreto
	
	^ false ! !

!Arenoso methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:38:44'!
esTierra
	
	^ false ! !


!Arenoso methodsFor: 'excavacion' stamp: 'sm 5/8/2023 17:41:40'!
taladrarseConPerforadora: aPerforadora 

	aPerforadora darGolpeDeTaladroASueloArenoso: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arenoso class' category: 'ISW1-2023-1C-Parcial-1'!
Arenoso class
	instanceVariableNames: ''!

!Arenoso class methodsFor: 'scan' stamp: 'sm 5/8/2023 19:46:55'!
scan

	^ 7! !


!classDefinition: #Concreto category: 'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #Concreto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!


!Concreto methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:37:18'!
esArenoso

	^ false! !

!Concreto methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:38:06'!
esConcreto
	
	^ true! !

!Concreto methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:38:54'!
esTierra
	
	^ false! !


!Concreto methodsFor: 'excavacion' stamp: 'sm 5/8/2023 17:42:37'!
taladrarseConPerforadora: aPerforadora 

	aPerforadora darGolpeDeTaladroASueloDeConcreto: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Concreto class' category: 'ISW1-2023-1C-Parcial-1'!
Concreto class
	instanceVariableNames: ''!

!Concreto class methodsFor: 'scan' stamp: 'sm 5/8/2023 19:47:04'!
scan

	^ 50! !


!classDefinition: #Tierra category: 'ISW1-2023-1C-Parcial-1'!
CapaDeSuelo subclass: #Tierra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!


!Tierra methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:37:32'!
esArenoso

	^ false! !

!Tierra methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:38:13'!
esConcreto
	
	^ false! !

!Tierra methodsFor: 'tipo' stamp: 'sm 5/8/2023 18:39:01'!
esTierra
	
	^ true! !


!Tierra methodsFor: 'excavacion' stamp: 'sm 5/8/2023 17:53:34'!
taladrarseConPerforadora: aPerforadora 

	aPerforadora darGolpeDeTaladroASueloDeTierra: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tierra class' category: 'ISW1-2023-1C-Parcial-1'!
Tierra class
	instanceVariableNames: ''!

!Tierra class methodsFor: 'scan' stamp: 'sm 5/8/2023 19:47:11'!
scan

	^10! !


!classDefinition: #Mecha category: 'ISW1-2023-1C-Parcial-1'!
Object subclass: #Mecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!


!Mecha methodsFor: 'asserting' stamp: 'sm 5/8/2023 18:30:47'!
assertEsPosiblePerforar
	
	^ true! !

!Mecha methodsFor: 'asserting' stamp: 'sm 5/8/2023 21:24:49'!
taladrarSueloArenosoConPerforadora: aPerforadora 
	
	self subclassResponsibility 
	! !

!Mecha methodsFor: 'asserting' stamp: 'sm 5/8/2023 21:24:55'!
taladrarSueloDeConcretoConPerforadora: aPerforadora 
	
	self subclassResponsibility 
	! !

!Mecha methodsFor: 'asserting' stamp: 'sm 5/8/2023 21:24:58'!
taladrarSueloDeTierraConPerforadora: aPerforadora 
	
	self subclassResponsibility 
	! !


!classDefinition: #Diamante category: 'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #Diamante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Diamante methodsFor: 'excavacion' stamp: 'sm 5/8/2023 21:18:48'!
taladrarSueloArenosoConPerforadora: aPerforadora 
	
	aPerforadora romperMecha.
	! !

!Diamante methodsFor: 'excavacion' stamp: 'sm 5/8/2023 18:26:48'!
taladrarSueloDeConcretoConPerforadora: aPerforadora 
	
	aPerforadora vecesQueGolpeoCapaActual even ifTrue: [ 			
		aPerforadora capaDeSueloInmediata bajaUnDecimoDeResistencia
	].
	
	aPerforadora capaDeSueloInmediata sinResistencia ifTrue: [ 
		aPerforadora transformarCapaEnArenoso
	].

	! !

!Diamante methodsFor: 'excavacion' stamp: 'sm 5/8/2023 18:26:20'!
taladrarSueloDeTierraConPerforadora: aPerforadora 
	
	aPerforadora pasarAProximaCapa 
	! !


!classDefinition: #Rota category: 'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #Rota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Rota methodsFor: 'asserting' stamp: 'sm 5/8/2023 20:02:16'!
assertEsPosiblePerforar
	
	^ self error: 'No puede perforar'! !


!classDefinition: #SinMecha category: 'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #SinMecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!SinMecha methodsFor: 'asserting' stamp: 'sm 5/8/2023 18:31:19'!
assertEsPosiblePerforar
	
	^ self error: 'No puede perforar'! !


!classDefinition: #Soft category: 'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #Soft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Soft methodsFor: 'excavacion' stamp: 'sm 5/8/2023 18:11:30'!
taladrarSueloArenosoConPerforadora: aPerforadora 
	
	aPerforadora pasarAProximaCapa ! !

!Soft methodsFor: 'excavacion' stamp: 'sm 5/8/2023 21:18:48'!
taladrarSueloDeConcretoConPerforadora: aPerforadora 
	
	aPerforadora romperMecha.! !

!Soft methodsFor: 'excavacion' stamp: 'sm 5/8/2023 18:10:50'!
taladrarSueloDeTierraConPerforadora: aPerforadora 
	
	! !


!classDefinition: #Widia category: 'ISW1-2023-1C-Parcial-1'!
Mecha subclass: #Widia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Widia methodsFor: 'excavacion' stamp: 'sm 5/8/2023 18:11:57'!
taladrarSueloArenosoConPerforadora: aPerforadora 
	
	aPerforadora pasarAProximaCapa ! !

!Widia methodsFor: 'excavacion' stamp: 'sm 5/8/2023 21:18:48'!
taladrarSueloDeConcretoConPerforadora: aPerforadora 
	
	aPerforadora vecesQueGolpeoCapaActual = 3 ifTrue: [ 
		aPerforadora romperMecha.
	].! !

!Widia methodsFor: 'excavacion' stamp: 'sm 5/8/2023 18:22:17'!
taladrarSueloDeTierraConPerforadora: aPerforadora 
	
	aPerforadora vecesQueGolpeoCapaActual = 2 ifTrue: [ 
		aPerforadora transformarCapaEnArenoso 
	].! !


!classDefinition: #Perforadora category: 'ISW1-2023-1C-Parcial-1'!
Object subclass: #Perforadora
	instanceVariableNames: 'mechaPuesta vecesQueGolpeoCapaActual capasDeSueloDebajo container'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2023-1C-Parcial-1'!

!Perforadora methodsFor: 'cambiar capa' stamp: 'sm 5/8/2023 21:16:33'!
pasarAProximaCapa

	vecesQueGolpeoCapaActual := 0.
	capasDeSueloDebajo := capasDeSueloDebajo allButFirst.
	
	capasDeSueloDebajo ifEmpty: [^self]. 
	
	(self capaDeSueloInmediata isKindOf: CapaDeSuelo) ifFalse: [
			container addAll: capasDeSueloDebajo.
	]! !

!Perforadora methodsFor: 'cambiar capa' stamp: 'sm 5/8/2023 20:11:16'!
transformarCapaEnArenoso

	capasDeSueloDebajo :=
			capasDeSueloDebajo allButFirst asOrderedCollection
			addFirst: CapaDeSuelo arenoso;
			yourself! !


!Perforadora methodsFor: 'excavation' stamp: 'sm 5/8/2023 20:04:47'!
darGolpeDeTaladro
		
	mechaPuesta assertEsPosiblePerforar.
	
	self incrementarGolpesCapaActual.
	self capaDeSueloInmediata taladrarseConPerforadora: self.! !

!Perforadora methodsFor: 'excavation' stamp: 'sm 5/8/2023 18:32:49'!
darGolpeDeTaladroASueloArenoso: unSueloArenoso 
	
	mechaPuesta taladrarSueloArenosoConPerforadora: self.! !

!Perforadora methodsFor: 'excavation' stamp: 'sm 5/8/2023 18:32:55'!
darGolpeDeTaladroASueloDeConcreto: unSueloDeConcreto
	
	mechaPuesta taladrarSueloDeConcretoConPerforadora: self.! !

!Perforadora methodsFor: 'excavation' stamp: 'sm 5/8/2023 18:33:02'!
darGolpeDeTaladroASueloDeTierra: unSueloDeTierra 
	
	mechaPuesta taladrarSueloDeTierraConPerforadora: self.! !

!Perforadora methodsFor: 'excavation' stamp: 'sm 5/8/2023 18:32:14'!
incrementarGolpesCapaActual

	^ vecesQueGolpeoCapaActual := vecesQueGolpeoCapaActual + 1! !

!Perforadora methodsFor: 'excavation' stamp: 'sm 5/8/2023 21:18:48'!
romperMecha

	mechaPuesta := Rota new.
	self error: 'Se rompió'.! !


!Perforadora methodsFor: 'initialization' stamp: 'sm 5/8/2023 20:06:16'!
initialize

	vecesQueGolpeoCapaActual := 0.
	container := OrderedCollection new.
	mechaPuesta := SinMecha new.! !

!Perforadora methodsFor: 'initialization' stamp: 'sm 5/8/2023 20:14:53'!
initializeSobreSuelo: capasDeSueloAExcavarInicialmente

	self assertNoHayDosCapasContiguasDelMismoTipoEn: capasDeSueloAExcavarInicialmente.
	capasDeSueloDebajo := capasDeSueloAExcavarInicialmente.! !


!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 20:17:21'!
capaDeSueloInmediata
	^capasDeSueloDebajo first! !

!Perforadora methodsFor: 'accessing' stamp: 'sm 5/8/2023 18:05:40'!
conMechaRota

	^mechaPuesta class = Rota! !

!Perforadora methodsFor: 'accessing' stamp: 'ARM 4/27/2023 21:12:20'!
elementsInContainer
	^container asArray! !

!Perforadora methodsFor: 'accessing' stamp: 'sm 5/8/2023 18:06:20'!
sinMecha

	^mechaPuesta class = SinMecha! !

!Perforadora methodsFor: 'accessing' stamp: 'sm 5/8/2023 18:19:54'!
vecesQueGolpeoCapaActual

	^ vecesQueGolpeoCapaActual ! !


!Perforadora methodsFor: 'sobre qué suelo' stamp: 'sm 5/8/2023 20:10:28'!
sobreSueloArenoso
	^ self capaDeSueloInmediata esArenoso! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'sm 5/8/2023 20:10:55'!
sobreSueloConcreto
	^ self capaDeSueloInmediata esConcreto! !

!Perforadora methodsFor: 'sobre qué suelo' stamp: 'sm 5/8/2023 20:11:06'!
sobreSueloTierra
	^ self capaDeSueloInmediata esTierra! !


!Perforadora methodsFor: 'colocar mecha' stamp: 'sm 5/8/2023 18:04:30'!
ponerMechaDiamante
	mechaPuesta := Diamante new.! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'sm 5/8/2023 18:04:37'!
ponerMechaSoft
	mechaPuesta := Soft new.! !

!Perforadora methodsFor: 'colocar mecha' stamp: 'sm 5/8/2023 18:04:48'!
ponerMechaWidia
	mechaPuesta := Widia new.! !


!Perforadora methodsFor: 'scan' stamp: 'sm 5/8/2023 18:51:33'!
calcularProfundidadDelSuelo
	
	^ capasDeSueloDebajo sum: [ :capa | capa altura ]
	
	 ! !

!Perforadora methodsFor: 'scan' stamp: 'sm 5/8/2023 20:43:17'!
calcularProfundidadDelSueloHasta: tipoDeCapa
	
	| altura|
	
	altura := 0.
	
	capasDeSueloDebajo do: [ :capa |
		
		(tipoDeCapa mismoScanQueCapa: capa) ifTrue: [ ^ altura ].
		altura := altura + capa altura.
	].

	^ altura.! !

!Perforadora methodsFor: 'scan' stamp: 'sm 5/8/2023 19:55:56'!
contarCapas: tipoDeCapa
	
	"Cuenta las capas de tipo tipoDeCapa. Recordar que para identificar cada capa se utiliza el valor de scan que retorna. Por ej. un capa tipo Arenoso retorna 7 al scan"
	
	| capas |

	capas := capasDeSueloDebajo select: [ :capa | 
		tipoDeCapa mismoScanQueCapa: capa
	].

	^ capas size! !


!Perforadora methodsFor: 'asserting' stamp: 'sm 5/8/2023 20:39:42'!
assertNoHayDosCapasContiguasDelMismoTipoEn: capasDeSueloAExcavarInicialmente 
	
	| ultimaCapa |
	
	ultimaCapa := ''.
	
	(capasDeSueloAExcavarInicialmente) do: [ :capa |
		
		capa = ultimaCapa ifTrue: [
			self error: 'No puede haber dos capas contiguas idénticas'.	
		].
		ultimaCapa := capa.
	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Perforadora class' category: 'ISW1-2023-1C-Parcial-1'!
Perforadora class
	instanceVariableNames: ''!

!Perforadora class methodsFor: 'instance creation' stamp: 'ARM 4/27/2023 20:07:05'!
sobreSuelo: capasDeSueloAExcavar 

	^self new initializeSobreSuelo: capasDeSueloAExcavar ! !
