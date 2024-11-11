Class {
	#name : 'MGCardElement',
	#superclass : 'BlElement',
	#instVars : [
		'card'
	],
	#category : 'Bloc-Memory-Elements',
	#package : 'Bloc-Memory',
	#tag : 'Elements'
}

{ #category : 'as yet unclassified' }
MGCardElement >> backgroundPaint [
	"Return a BlPaint that should be used as a background (fill)
of both back and face sides of the card. Colors are polĀmorphic
with BlPaint and therefore can be used too."

	^ Color pink darker
]

{ #category : 'accessing' }
MGCardElement >> card [

	^ card
]

{ #category : 'accessing' }
MGCardElement >> card: aMgCard [

	card := aMgCard
]

{ #category : 'initialization' }
MGCardElement >> initialize [

	super initialize.
	self size: 80 @ 80.
	self background: self backgroundPaint.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 12).
	self card: (MGCard new symbol: $a)
]
