'From Cuis7.0 [latest update: #6452] on 5 July 2024 at 8:34:32 am'!
'Description '!
!provides: 'Wayland' 1 8!
!requires: 'Network-Kernel' 1 7 nil!
!requires: 'YAXO' 1 27 nil!
SystemOrganization addCategory: #'Wayland-XML'!
SystemOrganization addCategory: #Wayland!


!classDefinition: #WaylandXML category: #'Wayland-XML'!
Object subclass: #WaylandXML
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland-XML'!
!classDefinition: 'WaylandXML class' category: #'Wayland-XML'!
WaylandXML class
	instanceVariableNames: 'xml'!

!classDefinition: #WaylandXMLEnum category: #'Wayland-XML'!
Object subclass: #WaylandXMLEnum
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland-XML'!
!classDefinition: 'WaylandXMLEnum class' category: #'Wayland-XML'!
WaylandXMLEnum class
	instanceVariableNames: ''!

!classDefinition: #WaylandXMLEvent category: #'Wayland-XML'!
Object subclass: #WaylandXMLEvent
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland-XML'!
!classDefinition: 'WaylandXMLEvent class' category: #'Wayland-XML'!
WaylandXMLEvent class
	instanceVariableNames: ''!

!classDefinition: #WaylandXMLInterface category: #'Wayland-XML'!
Object subclass: #WaylandXMLInterface
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland-XML'!
!classDefinition: 'WaylandXMLInterface class' category: #'Wayland-XML'!
WaylandXMLInterface class
	instanceVariableNames: ''!

!classDefinition: #WaylandXMLRequest category: #'Wayland-XML'!
Object subclass: #WaylandXMLRequest
	instanceVariableNames: 'xml'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland-XML'!
!classDefinition: 'WaylandXMLRequest class' category: #'Wayland-XML'!
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
