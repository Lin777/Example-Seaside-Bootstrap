Class {
	#name : #SBContactInformation,
	#superclass : #Object,
	#instVars : [
		'id',
		'direction',
		'city',
		'country',
		'province',
		'postal',
		'facebook',
		'twitter',
		'homePage',
		'emailUser'
	],
	#category : #'Seaside-Example-Bootstrap-Models'
}

{ #category : #'instance creation' }
SBContactInformation class >> newFromDataRow: aPGDataRow [

 ^ SBContactInformation new
  id: (aPGDataRow atName: #id);
  emailUser: (aPGDataRow atName: #useremail);
  direction: (aPGDataRow atName: #direction);
  city: (aPGDataRow atName: #city);
  country: (aPGDataRow atName: #country);
  province: (aPGDataRow atName: #province);
  postal: (aPGDataRow atName: #postal);
  facebook: (aPGDataRow atName: #facebook);
  twitter: (aPGDataRow atName: #twiter);
  homePage: (aPGDataRow atName: #homepage);
  yourself
]

{ #category : #accessing }
SBContactInformation >> city [
	^ city
]

{ #category : #accessing }
SBContactInformation >> city: anObject [
	city := anObject
]

{ #category : #accessing }
SBContactInformation >> country [
	^ country
]

{ #category : #accessing }
SBContactInformation >> country: anObject [
	country := anObject
]

{ #category : #accessing }
SBContactInformation >> direction [
	^ direction
]

{ #category : #accessing }
SBContactInformation >> direction: anObject [
	direction := anObject
]

{ #category : #accessing }
SBContactInformation >> emailUser [
	^ emailUser
]

{ #category : #accessing }
SBContactInformation >> emailUser: anObject [
	emailUser := anObject
]

{ #category : #accessing }
SBContactInformation >> facebook [
	^ facebook
]

{ #category : #accessing }
SBContactInformation >> facebook: anObject [
	facebook := anObject
]

{ #category : #accessing }
SBContactInformation >> homePage [
	^ homePage
]

{ #category : #accessing }
SBContactInformation >> homePage: anObject [
	homePage := anObject
]

{ #category : #accessing }
SBContactInformation >> id [
	^ id
]

{ #category : #accessing }
SBContactInformation >> id: anObject [
	id := anObject
]

{ #category : #accessing }
SBContactInformation >> postal [
	^ postal
]

{ #category : #accessing }
SBContactInformation >> postal: anObject [
	postal := anObject
]

{ #category : #accessing }
SBContactInformation >> province [
	^ province
]

{ #category : #accessing }
SBContactInformation >> province: anObject [
	province := anObject
]

{ #category : #accessing }
SBContactInformation >> twitter [
	^ twitter
]

{ #category : #accessing }
SBContactInformation >> twitter: anObject [
	twitter := anObject
]
