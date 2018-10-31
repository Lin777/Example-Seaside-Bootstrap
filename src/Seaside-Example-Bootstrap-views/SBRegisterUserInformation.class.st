Class {
	#name : #SBRegisterUserInformation,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'repeatedPassword',
		'messageComponent'
	],
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #accessing }
SBRegisterUserInformation >> messageComponent [
	^ messageComponent
]

{ #category : #accessing }
SBRegisterUserInformation >> messageComponent: anObject [
	messageComponent := anObject
]

{ #category : #accessing }
SBRegisterUserInformation >> repeatedPassword [
	^ repeatedPassword
]

{ #category : #accessing }
SBRegisterUserInformation >> repeatedPassword: anObject [
	repeatedPassword := anObject
]

{ #category : #accessing }
SBRegisterUserInformation >> user [
	^ user
]

{ #category : #accessing }
SBRegisterUserInformation >> user: anObject [
	user := anObject
]
