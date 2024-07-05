'From Cuis7.0 [latest update: #6452] on 5 July 2024 at 10:28:50 am'!
'Description '!
!provides: 'Wayland' 1 10!
!requires: 'Network-Kernel' 1 7 nil!
!requires: 'YAXO' 1 27 nil!
SystemOrganization addCategory: #Wayland!


!classDefinition: #Wayland category: #Wayland!
Object subclass: #Wayland
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'Wayland class' category: #Wayland!
Wayland class
	instanceVariableNames: ''!

!classDefinition: #WaylandEvent category: #Wayland!
Object subclass: #WaylandEvent
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandEvent class' category: #Wayland!
WaylandEvent class
	instanceVariableNames: ''!

!classDefinition: #WaylandEventError category: #Wayland!
WaylandEvent subclass: #WaylandEventError
	instanceVariableNames: 'object_id code message'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandEventError class' category: #Wayland!
WaylandEventError class
	instanceVariableNames: ''!

!classDefinition: #WaylandObject category: #Wayland!
Object subclass: #WaylandObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandObject class' category: #Wayland!
WaylandObject class
	instanceVariableNames: ''!

!classDefinition: #WaylandDisplay category: #Wayland!
WaylandObject subclass: #WaylandDisplay
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandDisplay class' category: #Wayland!
WaylandDisplay class
	instanceVariableNames: ''!

!classDefinition: #WaylandType category: #Wayland!
Object subclass: #WaylandType
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandType class' category: #Wayland!
WaylandType class
	instanceVariableNames: ''!

!classDefinition: #WaylandArray category: #Wayland!
WaylandType subclass: #WaylandArray
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandArray class' category: #Wayland!
WaylandArray class
	instanceVariableNames: ''!

!classDefinition: #WaylandEnum category: #Wayland!
WaylandType subclass: #WaylandEnum
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandEnum class' category: #Wayland!
WaylandEnum class
	instanceVariableNames: ''!

!classDefinition: #WaylandEnumError category: #Wayland!
WaylandEnum subclass: #WaylandEnumError
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandEnumError class' category: #Wayland!
WaylandEnumError class
	instanceVariableNames: ''!

!classDefinition: #WaylandFD category: #Wayland!
WaylandType subclass: #WaylandFD
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandFD class' category: #Wayland!
WaylandFD class
	instanceVariableNames: ''!

!classDefinition: #WaylandFixed category: #Wayland!
WaylandType subclass: #WaylandFixed
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandFixed class' category: #Wayland!
WaylandFixed class
	instanceVariableNames: ''!

!classDefinition: #WaylandInt category: #Wayland!
WaylandType subclass: #WaylandInt
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandInt class' category: #Wayland!
WaylandInt class
	instanceVariableNames: ''!

!classDefinition: #WaylandString category: #Wayland!
WaylandType subclass: #WaylandString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandString class' category: #Wayland!
WaylandString class
	instanceVariableNames: ''!

!classDefinition: #WaylandUint category: #Wayland!
WaylandType subclass: #WaylandUint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandUint class' category: #Wayland!
WaylandUint class
	instanceVariableNames: ''!


!Wayland class methodsFor: 'as yet unclassified' stamp: 'nafiz 7/5/2024 09:11:06'!
copyright
^ 'copyright'! !

!WaylandDisplay methodsFor: 'as yet unclassified' stamp: 'nafiz 7/5/2024 08:47:26'!
get_registry: aRegistry! !

!WaylandDisplay methodsFor: 'as yet unclassified' stamp: 'nafiz 7/5/2024 08:47:02'!
sync: aCallback! !

!WaylandEnumError methodsFor: 'as yet unclassified' stamp: 'nafiz 7/5/2024 10:27:43'!
entryName
	value = 0 ifTrue: [ ^ 'invalid_object' ].
	value = 1 ifTrue: [ ^ 'invalid_method' ].
	value = 2 ifTrue: [ ^ 'no_memory' ].
	value = 3 ifTrue: [ ^ 'implementation' ].
	^ nil.! !
