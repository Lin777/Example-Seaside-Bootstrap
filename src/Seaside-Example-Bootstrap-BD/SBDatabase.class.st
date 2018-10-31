Class {
	#name : #SBDatabase,
	#superclass : #Object,
	#category : #'Seaside-Example-Bootstrap-BD'
}

{ #category : #adding }
SBDatabase >> addAditionalInformation: aConferenceOptions toUser: aUser [
	self subclassResponsibility 
]

{ #category : #adding }
SBDatabase >> addAfiliationInformation: aConferenceOptions toUser: aUser [
	self subclassResponsibility 
]

{ #category : #adding }
SBDatabase >> addConferenceOptions: aConferenceOptions toUser: aUser [
	self subclassResponsibility 
]

{ #category : #adding }
SBDatabase >> addContactInfo: aContactInfo toUser: aUser [
	self subclassResponsibility 
]

{ #category : #adding }
SBDatabase >> addPaymentInformation: aConferenceOptions toUser: aUser [
	self subclassResponsibility 
]

{ #category : #adding }
SBDatabase >> addUser: aUser [
	self subclassResponsibility 
]

{ #category : #adding }
SBDatabase >> connect [

 ^ true
]

{ #category : #adding }
SBDatabase >> connectionFailed [

 ^ false
]

{ #category : #adding }
SBDatabase >> disconnect [

 ^ true

]

{ #category : #adding }
SBDatabase >> findUserByEmail: aEmail [
	self subclassResponsibility 
]

{ #category : #adding }
SBDatabase >> updateContactInfo: aTask [
	self subclassResponsibility 
]
