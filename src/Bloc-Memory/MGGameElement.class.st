Class {
	#name : 'MGGameElement',
	#superclass : 'BlElement',
	#instVars : [
		'memoryGame'
	],
	#category : 'Bloc-Memory-Elements',
	#package : 'Bloc-Memory',
	#tag : 'Elements'
}

{ #category : 'as yet unclassified' }
MGGameElement class >> openWithNumber [

	| aGameElement space |
	aGameElement := MGGameElement new
		                memoryGame: MGGame withNumbers;
		                yourself.
	space := BlSpace new.
	space root addChild: aGameElement.
	space root whenLayoutedDoOnce: [ space extent: aGameElement size ].
	space show
]

{ #category : 'initialization' }
MGGameElement >> initialize [

	super initialize.
	self background: Color veryLightGray.
	self layout: (BlGridLayout horizontal cellSpacing: 20).
	self constraintsDo: [ :aLayoutConstraints |
		aLayoutConstraints horizontal fitContent.
		aLayoutConstraints vertical fitContent ]
]

{ #category : 'accessing' }
MGGameElement >> memoryGame [

	^ memoryGame
]

{ #category : 'accessing' }
MGGameElement >> memoryGame: aGameModel [

	memoryGame := aGameModel.
	self layout columnCount: memoryGame gridSize.
	memoryGame availableCards do: [ :aCard |
		self addChild: (MGCardElement new card: aCard) ]
]
