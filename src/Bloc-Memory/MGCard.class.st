Class {
	#name : 'MGCard',
	#superclass : 'Object',
	#instVars : [
		'symbol',
		'flipped',
		'announcer'
	],
	#category : 'Bloc-Memory-Model',
	#package : 'Bloc-Memory',
	#tag : 'Model'
}

{ #category : 'accessing' }
MGCard >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'action' }
MGCard >> disappear [

	self notifyDisappear
]

{ #category : 'action' }
MGCard >> flip [

	flipped := flipped not.
	self notifĀFlipped
]

{ #category : 'initialization' }
MGCard >> initialize [

	super initialize.
	flipped := false
]

{ #category : 'testing' }
MGCard >> isFlipped [

	^ flipped
]

{ #category : 'notification' }
MGCard >> notifyDisappear [

	self announcer announce: MGCardDisappearAnnouncement new
]

{ #category : 'notification' }
MGCard >> notifyFlipped [

	self announcer announce: MGCardFlippedAnnouncement new
]

{ #category : 'printing' }
MGCard >> printOn: aStream [

	aStream
		nextPutAll: 'Card';
		nextPut: Character space;
		nextPut: $(;
		nextPut: self symbol;
		nextPut: $)
]

{ #category : 'accessing' }
MGCard >> symbol [

	^ symbol
]

{ #category : 'accessing' }
MGCard >> symbol: aCharacter [

	symbol := aCharacter
]
