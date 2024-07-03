'From Cuis7.0 [latest update: #6452] on 3 July 2024 at 7:36:50 pm'!
'Description '!
!provides: 'Wayland' 1 4!
!requires: 'Network-Kernel' 1 7 nil!
!requires: 'YAXO' 1 27 nil!
SystemOrganization addCategory: #Wayland!


!classDefinition: #UnixDomainSocket category: #Wayland!
Socket subclass: #UnixDomainSocket
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Wayland'!
!classDefinition: 'UnixDomainSocket class' category: #Wayland!
UnixDomainSocket class
	instanceVariableNames: ''!

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


!UnixDomainSocket methodsFor: 'as yet unclassified' stamp: 'nafiz 7/3/2024 19:31:57'!
connectTo: socketAddress
  | status |
   
  status := self primSocketConnectionStatus: socketHandle.
  (status == Unconnected)
    ifFalse: [InvalidSocketStatusException signal: 'Socket status must Unconnected before opening a new connection'].
   
  self primSocket: socketHandle connectTo: socketAddress! !

!UnixDomainSocket methodsFor: 'as yet unclassified' stamp: 'nafiz 7/3/2024 19:32:06'!
initialize: socketType withDomain: socketDomain
	"Initialize a new socket handle. If socket creation fails, socketHandle will be set to nil."
	| semaIndex readSemaIndex writeSemaIndex |

	semaphore := Semaphore new.
	readSemaphore := Semaphore new.
	writeSemaphore := Semaphore new.
	semaIndex := Smalltalk registerExternalObject: semaphore.
	readSemaIndex := Smalltalk registerExternalObject: readSemaphore.
	writeSemaIndex := Smalltalk registerExternalObject: writeSemaphore.
	socketHandle :=
		self primSocketCreateNetwork: socketDomain
			type: socketType
			receiveBufferSize: 8000
			sendBufSize: 8000
			semaIndex: semaIndex
			readSemaIndex: readSemaIndex
			writeSemaIndex: writeSemaIndex.

	socketHandle 
		ifNotNil: [ self register ]
		ifNil: [  "socket creation failed"
			Smalltalk unregisterExternalObject: semaphore.
			Smalltalk unregisterExternalObject: readSemaphore.
			Smalltalk unregisterExternalObject: writeSemaphore.
			readSemaphore := writeSemaphore := semaphore := nil ]
! !

!UnixDomainSocket methodsFor: 'as yet unclassified' stamp: 'nafiz 7/3/2024 19:32:10'!
newUDS
  "Create a socket and initialise it for IPC aka Unix domain."
  self initializeNetwork.
  ^[ super new initialize: TCPSocketType withDomain: 1 ]
   repeatWithGCIf: [ :socket | socket isValid not ]! !

!UnixDomainSocket methodsFor: 'as yet unclassified' stamp: 'nafiz 7/3/2024 19:32:18'!
primSocket: socket connectTo: socketAddress
	<primitive: 'primitiveSocketConnectTo' module: 'SocketPlugin'>
	self primitiveFailed
! !

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
