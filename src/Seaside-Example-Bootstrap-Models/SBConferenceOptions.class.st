Class {
	#name : #SBConferenceOptions,
	#superclass : #Object,
	#instVars : [
		'id',
		'emailUser',
		'monday',
		'tuesday',
		'wendsday',
		'thursday',
		'friday',
		'tShirt',
		'vegetarian',
		'socialEvent',
		'addedMainList'
	],
	#category : #'Seaside-Example-Bootstrap-Models'
}

{ #category : #'instance creation' }
SBConferenceOptions class >> newFromDataRow: aPGDataRow [

 ^ SBConferenceOptions new
  id: (aPGDataRow atName: #id);
  emailUser: (aPGDataRow atName: #useremail);
  monday: (aPGDataRow atName: #monday);
  tuesday: (aPGDataRow atName: #tuesday);
  wendsday: (aPGDataRow atName: #wednesday);
  thursday: (aPGDataRow atName: #thursday);
  friday: (aPGDataRow atName: #friday);
  tShirt: (aPGDataRow atName: #tshirtsize);
  vegetarian: (aPGDataRow atName: #vegetarian);
  socialEvent: (aPGDataRow atName: #socialevent);
  addedMainList: (aPGDataRow atName: #addedmainlist);
  yourself
]

{ #category : #accessing }
SBConferenceOptions >> addedMainList [
	^ addedMainList
]

{ #category : #accessing }
SBConferenceOptions >> addedMainList: anObject [
	addedMainList := anObject
]

{ #category : #accessing }
SBConferenceOptions >> emailUser [
	^ emailUser
]

{ #category : #accessing }
SBConferenceOptions >> emailUser: anObject [
	emailUser := anObject
]

{ #category : #accessing }
SBConferenceOptions >> friday [
	^ friday
]

{ #category : #accessing }
SBConferenceOptions >> friday: anObject [
	friday := anObject
]

{ #category : #accessing }
SBConferenceOptions >> id [
	^ id
]

{ #category : #accessing }
SBConferenceOptions >> id: anObject [
	id := anObject
]

{ #category : #'as yet unclassified' }
SBConferenceOptions >> intialize [
	super initialize.
	self tShirt: #Small.
	self vegetarian: false.
	self socialEvent: false.
	self addedMainList: false.
]

{ #category : #accessing }
SBConferenceOptions >> monday [
	^ monday
]

{ #category : #accessing }
SBConferenceOptions >> monday: anObject [
	monday := anObject
]

{ #category : #accessing }
SBConferenceOptions >> socialEvent [
	^ socialEvent
]

{ #category : #accessing }
SBConferenceOptions >> socialEvent: anObject [
	socialEvent := anObject
]

{ #category : #accessing }
SBConferenceOptions >> tShirt [
	^ tShirt
]

{ #category : #accessing }
SBConferenceOptions >> tShirt: anObject [
	tShirt := anObject
]

{ #category : #accessing }
SBConferenceOptions >> thursday [
	^ thursday
]

{ #category : #accessing }
SBConferenceOptions >> thursday: anObject [
	thursday := anObject
]

{ #category : #accessing }
SBConferenceOptions >> tuesday [
	^ tuesday
]

{ #category : #accessing }
SBConferenceOptions >> tuesday: anObject [
	tuesday := anObject
]

{ #category : #accessing }
SBConferenceOptions >> vegetarian [
	^ vegetarian
]

{ #category : #accessing }
SBConferenceOptions >> vegetarian: anObject [
	vegetarian := anObject
]

{ #category : #accessing }
SBConferenceOptions >> wendsday [
	^ wendsday
]

{ #category : #accessing }
SBConferenceOptions >> wendsday: anObject [
	wendsday := anObject
]
