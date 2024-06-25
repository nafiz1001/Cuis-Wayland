'From Cuis7.0 [latest update: #6454] on 25 June 2024 at 6:57:09 pm'!
'Description '!
!provides: 'Wayland' 1 2!
SystemOrganization addCategory: #Wayland!


!classDefinition: #WaylandXML category: #Wayland!
Object subclass: #WaylandXML
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandXML class' category: #Wayland!
WaylandXML class
	instanceVariableNames: 'xml'!

!classDefinition: #WaylandXMLEnum category: #Wayland!
Object subclass: #WaylandXMLEnum
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandXMLEnum class' category: #Wayland!
WaylandXMLEnum class
	instanceVariableNames: ''!

!classDefinition: #WaylandXMLEvent category: #Wayland!
Object subclass: #WaylandXMLEvent
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandXMLEvent class' category: #Wayland!
WaylandXMLEvent class
	instanceVariableNames: ''!

!classDefinition: #WaylandXMLInterface category: #Wayland!
Object subclass: #WaylandXMLInterface
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandXMLInterface class' category: #Wayland!
WaylandXMLInterface class
	instanceVariableNames: ''!

!classDefinition: #WaylandXMLRequest category: #Wayland!
Object subclass: #WaylandXMLRequest
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'WaylandXMLRequest class' category: #Wayland!
WaylandXMLRequest class
	instanceVariableNames: ''!


!WaylandXML methodsFor: 'as yet unclassified' stamp: 'nafiz 6/25/2024 18:56:50'!
interfaces
	^ xml elements first elements
		select: [ :element | element name = #interface ]
		thenCollect: [ :element | WaylandXMLInterface new setXML: element ]! !

!WaylandXML methodsFor: 'as yet unclassified' stamp: 'nafiz 6/25/2024 17:59:27'!
parse: aWaylandXMLStream
	xml := XMLDOMParser parseDocumentFrom: 	aWaylandXMLStream! !

!WaylandXMLEnum methodsFor: 'as yet unclassified' stamp: 'nafiz 6/25/2024 18:07:02'!
setXML: aInterfaceXML
	xml := aInterfaceXML! !

!WaylandXMLEvent methodsFor: 'as yet unclassified' stamp: 'nafiz 6/25/2024 18:05:06'!
setXML: aInterfaceXML
	xml := aInterfaceXML! !

!WaylandXMLInterface methodsFor: 'as yet unclassified' stamp: 'nafiz 6/25/2024 18:56:30'!
enums
	^ xml elements first elements
		select: [ :element | element name = #enum ]
		thenCollect: [ :element | WaylandXMLEnum new setXML: element ]! !

!WaylandXMLInterface methodsFor: 'as yet unclassified' stamp: 'nafiz 6/25/2024 18:56:43'!
events
	^ xml elements first elements
		select: [ :element | element name = #event ]
		thenCollect: [ :element | WaylandXMLEvent new setXML: element ]! !

!WaylandXMLInterface methodsFor: 'as yet unclassified' stamp: 'nafiz 6/25/2024 18:56:56'!
requests
	^ xml elements first elements
		select: [ :element | element name = #request ]
		thenCollect: [ :element | WaylandXMLRequest new setXML: element ]! !

!WaylandXMLInterface methodsFor: 'as yet unclassified' stamp: 'nafiz 6/25/2024 18:02:44'!
setXML: aInterfaceXML
	xml := aInterfaceXML! !

!WaylandXMLRequest methodsFor: 'as yet unclassified' stamp: 'nafiz 6/25/2024 18:02:44'!
setXML: aInterfaceXML
	xml := aInterfaceXML! !
