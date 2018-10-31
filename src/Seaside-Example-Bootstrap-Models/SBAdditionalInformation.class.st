Class {
	#name : #SBAdditionalInformation,
	#superclass : #Object,
	#instVars : [
		'id',
		'emailUser',
		'keywords',
		'additionalText'
	],
	#category : #'Seaside-Example-Bootstrap-Models'
}

{ #category : #'instance creation' }
SBAdditionalInformation class >> newFromDataRow: aPGDataRow [

 ^ SBAdditionalInformation new
  id: (aPGDataRow atName: #id);
  emailUser: (aPGDataRow atName: #emailuser);
  keywords: (aPGDataRow atName: #keywords);
  additionalText: (aPGDataRow atName: #additionaltext);
  yourself
]

{ #category : #accessing }
SBAdditionalInformation >> additionalText [
	^ additionalText
]

{ #category : #accessing }
SBAdditionalInformation >> additionalText: anObject [
	additionalText := anObject
]

{ #category : #accessing }
SBAdditionalInformation >> emailUser [
	^ emailUser
]

{ #category : #accessing }
SBAdditionalInformation >> emailUser: anObject [
	emailUser := anObject
]

{ #category : #accessing }
SBAdditionalInformation >> id [
	^ id
]

{ #category : #accessing }
SBAdditionalInformation >> id: anObject [
	id := anObject
]

{ #category : #initialization }
SBAdditionalInformation >> initialize [
	super initialize.
	self keywords: ''.
	self additionalText: ''
	
]

{ #category : #accessing }
SBAdditionalInformation >> keywords [
	^ keywords
]

{ #category : #accessing }
SBAdditionalInformation >> keywords: anObject [
	keywords := anObject
]
