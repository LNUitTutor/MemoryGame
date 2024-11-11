Class {
	#name : 'MGCardEventListener',
	#superclass : 'BlEventListener',
	#instVars : [
		'memoryGame'
	],
	#category : 'Bloc-Memory-Elements',
	#package : 'Bloc-Memory',
	#tag : 'Elements'
}

{ #category : 'mouse handlers' }
MGCardEventListener >> clickEvent: anEvent [

	memoryGame chooseCard: anEvent currentTarget card
]

{ #category : 'accessing' }
MGCardEventListener >> memoryGame [

	^ memoryGame
]

{ #category : 'accessing' }
MGCardEventListener >> memoryGame: aGame [

	memoryGame := aGame
]
