Class {
	#name : 'MGGame',
	#superclass : 'Object',
	#instVars : [
		'availableCards',
		'chosenCards'
	],
	#category : 'Bloc-Memory-Model',
	#package : 'Bloc-Memory',
	#tag : 'Model'
}

{ #category : 'accessing' }
MGGame >> availableCards [

	^ availableCards
]

{ #category : 'constants' }
MGGame >> cardsCount [
	"Return how manĀ cards there should be depending on grid size"

	^ self gridSize squared
]

{ #category : 'action' }
MGGame >> chooseCard: aCard [

	(self chosenCards includes: aCard) ifTrue: [ ^ self ].
	self chosenCards add: aCard.
	aCard flip.
	self shouldCompleteStep ifTrue: [ ^ self completeStep ].
	self shouldResetStep ifTrue: [ self resetStep ]
]

{ #category : 'testing' }
MGGame >> chosenCardMatch [

	| firstCard |
	firstCard := self chosenCards first.
	^ self chosenCards allSatisfy: [ :aCard |
		  aCard isFlipped and: [ firstCard symbol = aCard symbol ] ]
]

{ #category : 'accessing' }
MGGame >> chosenCards [

	^ chosenCards
]

{ #category : 'action' }
MGGame >> completeStep [

	self chosenCards
		do: [ :aCard | aCard disappear ];
		removeAll
]

{ #category : 'constants' }
MGGame >> gridSize [
	"Return grid size"

	^ 4
]

{ #category : 'initialization' }
MGGame >> initialize [

	super initialize.
	availableCards := OrderedCollection new.
	chosenCards := OrderedCollection new
]

{ #category : 'initialization' }
MGGame >> initializeForSymbols: aCollectionOfCharacters [

	aCollectionOfCharacters size = (self cardsCount / self matchesCount)
		ifFalse: [
			self error: 'Amount of characters must be equal to possible all combinations' ].
	aCollectionOfCharacters do: [ :aSymbol |
		1 to: self matchesCount do: [ :i |
		availableCards add: (MGCard new symbol: aSymbol) ] ].
	availableCards := availableCards shuffled
]

{ #category : 'constants' }
MGGame >> matchesCount [
	"How manĀ chosen cards should match for them to disappear"

	^ 2
]

{ #category : 'action' }
MGGame >> resetStep [

	| lastCard |
	lastCard := self chosenCards last.
	self chosenCards
		allButLastDo: [ :aCard | aCard flip ];
		removeAll;
		add: lastCard
]

{ #category : 'testing' }
MGGame >> shouldCompleteStep [

	^ self chosenCards size = self matchesCount and: [
		  self chosenCardMatch ]
]

{ #category : 'testing' }
MGGame >> shouldResetStep [

	^ self chosenCards size > self matchesCount
]
