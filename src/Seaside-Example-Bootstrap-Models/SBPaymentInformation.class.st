Class {
	#name : #SBPaymentInformation,
	#superclass : #Object,
	#instVars : [
		'id',
		'userEmail',
		'paymentMethod',
		'currency',
		'paymentType'
	],
	#category : #'Seaside-Example-Bootstrap-Models'
}

{ #category : #'instance creation' }
SBPaymentInformation class >> newFromDataRow: aPGDataRow [

 ^ SBPaymentInformation new
  id: (aPGDataRow atName: #id);
  userEmail: (aPGDataRow atName: #emailuser);
  paymentMethod: (aPGDataRow atName: #paymentmethod);
  currency: (aPGDataRow atName: #currency);
  paymentType: (aPGDataRow atName: #paymenttype);
  yourself
]

{ #category : #accessing }
SBPaymentInformation >> currency [
	^ currency
]

{ #category : #accessing }
SBPaymentInformation >> currency: anObject [
	currency := anObject
]

{ #category : #accessing }
SBPaymentInformation >> id [
	^ id
]

{ #category : #accessing }
SBPaymentInformation >> id: anObject [
	id := anObject
]

{ #category : #accessing }
SBPaymentInformation >> paymentMethod [
	^ paymentMethod
]

{ #category : #accessing }
SBPaymentInformation >> paymentMethod: anObject [
	paymentMethod := anObject
]

{ #category : #accessing }
SBPaymentInformation >> paymentType [
	^ paymentType
]

{ #category : #accessing }
SBPaymentInformation >> paymentType: anObject [
	paymentType := anObject
]

{ #category : #accessing }
SBPaymentInformation >> userEmail [
	^ userEmail
]

{ #category : #accessing }
SBPaymentInformation >> userEmail: anObject [
	userEmail := anObject
]
