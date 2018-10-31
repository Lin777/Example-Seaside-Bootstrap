Class {
	#name : #SBUser,
	#superclass : #Object,
	#instVars : [
		'email',
		'firstName',
		'lastName',
		'password',
		'contactInfo',
		'conferenceOptions',
		'afiliationInfo',
		'additionalInfo',
		'paymentInfo'
	],
	#category : #'Seaside-Example-Bootstrap-Models'
}

{ #category : #'as yet unclassified' }
SBUser class >> hashPassword: aString [

 ^ aString 
  ifEmpty: [0] 
  ifNotEmpty: [GRPlatform current secureHashFor: aString].

]

{ #category : #'instance creation' }
SBUser class >> newFromResultSet: aPGResultSet [

 ^ (aPGResultSet rows size = 1)
  ifTrue: [ | row |
   row := aPGResultSet dataRows first.
   SBUser new
    email: (row atName: #email);
    firstName: (row atName: #firstname);
    lastName: (row atName: #lastname);
    password: (row atName: #password) asString;
    yourself]
   ifFalse: [nil]

]

{ #category : #accessing }
SBUser >> additionalInfo [
	^ additionalInfo
]

{ #category : #accessing }
SBUser >> additionalInfo: anObject [
	additionalInfo := anObject
]

{ #category : #accessing }
SBUser >> afiliationInfo [
	^ afiliationInfo
]

{ #category : #accessing }
SBUser >> afiliationInfo: anObject [
	afiliationInfo := anObject
]

{ #category : #accessing }
SBUser >> conferenceOptions [
	^ conferenceOptions
]

{ #category : #accessing }
SBUser >> conferenceOptions: anObject [
	conferenceOptions := anObject
]

{ #category : #accessing }
SBUser >> contactInfo [
	^ contactInfo
]

{ #category : #accessing }
SBUser >> contactInfo: anObject [
	contactInfo := anObject
]

{ #category : #accessing }
SBUser >> email [
	^ email
]

{ #category : #accessing }
SBUser >> email: anObject [
	email := anObject
]

{ #category : #accessing }
SBUser >> firstName [
	^ firstName
]

{ #category : #accessing }
SBUser >> firstName: anObject [
	firstName := anObject
]

{ #category : #initialization }
SBUser >> initialize [
	additionalInfo := SBAdditionalInformation new.
	afiliationInfo := SBAfiliationInformation new.
	conferenceOptions := SBConferenceOptions new.
	contactInfo := SBContactInformation new.
	paymentInfo := SBPaymentInformation new.
	
]

{ #category : #accessing }
SBUser >> lastName [
	^ lastName
]

{ #category : #accessing }
SBUser >> lastName: anObject [
	lastName := anObject
]

{ #category : #accessing }
SBUser >> password [
	^ password
]

{ #category : #accessing }
SBUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
SBUser >> paymentInfo [
	^ paymentInfo
]

{ #category : #accessing }
SBUser >> paymentInfo: anObject [
	paymentInfo := anObject
]
