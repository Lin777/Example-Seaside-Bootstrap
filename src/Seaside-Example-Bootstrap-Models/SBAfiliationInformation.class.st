Class {
	#name : #SBAfiliationInformation,
	#superclass : #Object,
	#instVars : [
		'id',
		'organizationName',
		'direction',
		'city',
		'country',
		'province',
		'postal',
		'membership',
		'emailUser'
	],
	#category : #'Seaside-Example-Bootstrap-Models'
}

{ #category : #'instance creation' }
SBAfiliationInformation class >> newFromDataRow: aPGDataRow [

 ^ SBAfiliationInformation new
  id: (aPGDataRow atName: #id);
  emailUser: (aPGDataRow atName: #useremail);
  organizationName: (aPGDataRow atName: #organizationname);
  direction: (aPGDataRow atName: #direction);
  city: (aPGDataRow atName: #city);
  country: (aPGDataRow atName: #country);
  province: (aPGDataRow atName: #province);
  postal: (aPGDataRow atName: #postal);
  membership: (aPGDataRow atName: #membership);
  yourself
]

{ #category : #accessing }
SBAfiliationInformation >> city [
	^ city
]

{ #category : #accessing }
SBAfiliationInformation >> city: anObject [
	city := anObject
]

{ #category : #accessing }
SBAfiliationInformation >> country [
	^ country
]

{ #category : #accessing }
SBAfiliationInformation >> country: anObject [
	country := anObject
]

{ #category : #accessing }
SBAfiliationInformation >> direction [
	^ direction
]

{ #category : #accessing }
SBAfiliationInformation >> direction: anObject [
	direction := anObject
]

{ #category : #accessing }
SBAfiliationInformation >> emailUser [
	^ emailUser
]

{ #category : #accessing }
SBAfiliationInformation >> emailUser: anObject [
	emailUser := anObject
]

{ #category : #accessing }
SBAfiliationInformation >> id [
	^ id
]

{ #category : #accessing }
SBAfiliationInformation >> id: anObject [
	id := anObject
]

{ #category : #initialization }
SBAfiliationInformation >> initialize [
	super initialize.
	self membership: #Industrial.
]

{ #category : #accessing }
SBAfiliationInformation >> membership [
	^ membership
]

{ #category : #accessing }
SBAfiliationInformation >> membership: anObject [
	membership := anObject
]

{ #category : #accessing }
SBAfiliationInformation >> organizationName [
	^ organizationName
]

{ #category : #accessing }
SBAfiliationInformation >> organizationName: anObject [
	organizationName := anObject
]

{ #category : #accessing }
SBAfiliationInformation >> postal [
	^ postal
]

{ #category : #accessing }
SBAfiliationInformation >> postal: anObject [
	postal := anObject
]

{ #category : #accessing }
SBAfiliationInformation >> province [
	^ province
]

{ #category : #accessing }
SBAfiliationInformation >> province: anObject [
	province := anObject
]
