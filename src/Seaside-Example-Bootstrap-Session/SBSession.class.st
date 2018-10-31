Class {
	#name : #SBSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'database'
	],
	#category : #'Seaside-Example-Bootstrap-Session'
}

{ #category : #accessing }
SBSession >> database [
	^ database
]

{ #category : #accessing }
SBSession >> database: anObject [
	database := anObject
]

{ #category : #adding }
SBSession >> findUserByEmail: anEmail [

 ^ self database findUserByEmail: anEmail

]

{ #category : #adding }
SBSession >> initialize [
 
 super initialize.
 self database: SBRelationalDataBase new.

]

{ #category : #adding }
SBSession >> isLoggedIn [

 ^ self user notNil
]

{ #category : #adding }
SBSession >> login: aUser [
 
 self user: aUser.

]

{ #category : #adding }
SBSession >> logout [

 self user: nil.
]

{ #category : #adding }
SBSession >> responseForRequest: aRequest [

 self database connectionFailed
  ifTrue: [^ WAResponse new nextPutAll: 'No Database Connection'].
 ^ super responseForRequest: aRequest

]

{ #category : #adding }
SBSession >> unregistered [

 self database disconnect.
 super unregistered.
]

{ #category : #adding }
SBSession >> updateRoot: anHtmlRoot [

 super updateRoot: anHtmlRoot.
 anHtmlRoot title: SBLibrary  applicationName.
]

{ #category : #accessing }
SBSession >> user [
	^ user
]

{ #category : #accessing }
SBSession >> user: anObject [
	user := anObject
]
