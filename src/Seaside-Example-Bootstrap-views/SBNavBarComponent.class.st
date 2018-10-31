Class {
	#name : #SBNavBarComponent,
	#superclass : #WAComponent,
	#instVars : [
		'optionList',
		'logoutAction'
	],
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #initialization }
SBNavBarComponent >> addEntry: aString withAction: aBlock [
 
 ^ self optionList add: aString -> aBlock
]

{ #category : #hooks }
SBNavBarComponent >> children [ 

]

{ #category : #initialization }
SBNavBarComponent >> initialize [
	super initialize.
	self optionList: OrderedCollection new.

]

{ #category : #accessing }
SBNavBarComponent >> logoutAction [
	^ logoutAction
]

{ #category : #accessing }
SBNavBarComponent >> logoutAction: anObject [
	logoutAction := anObject
]

{ #category : #accessing }
SBNavBarComponent >> optionList [
	^ optionList
]

{ #category : #accessing }
SBNavBarComponent >> optionList: anObject [
	optionList := anObject
]

{ #category : #rendering }
SBNavBarComponent >> renderContentOn: html [
	html tbsNavbar beInverse
		with: [ html
				tbsContainer: [
					self optionList
						do: [ :entry | 
							html tbsNavbarBrand
								callback: entry value;
								with: entry key.
							html space ].
					html tbsNavbarText tbsPullRight
						with: [ html anchor
								callback: self logoutAction;
								with: 'Logout ' ] ] ]
]
