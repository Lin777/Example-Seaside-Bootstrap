Class {
	#name : #SBMessageComponent,
	#superclass : #WAComponent,
	#instVars : [
		'messageString',
		'messageType',
		'wasShown'
	],
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #accessing }
SBMessageComponent >> errorMessage: aString [

 self
  messageString: aString;
  messageType: 'error';
  wasShown: false.
]

{ #category : #accessing }
SBMessageComponent >> infoMessage: aString [

 self
  messageString: aString;
  messageType: 'info';
  wasShown: false.
]

{ #category : #accessing }
SBMessageComponent >> initialize [

 super initialize.
 self wasShown: true.
]

{ #category : #accessing }
SBMessageComponent >> messageString [
	^ messageString
]

{ #category : #accessing }
SBMessageComponent >> messageString: anObject [
	messageString := anObject
]

{ #category : #accessing }
SBMessageComponent >> messageType [
	^ messageType
]

{ #category : #accessing }
SBMessageComponent >> messageType: anObject [
	messageType := anObject
]

{ #category : #accessing }
SBMessageComponent >> renderContentOn: html [
	self wasShown
		ifTrue: [ ^ self ].
	html div
		with: [ html tbsAlert  attributeAt: 'name' put: 'message';
				beWarning;
				with: self messageString ].
	self wasShown: true
	
]

{ #category : #accessing }
SBMessageComponent >> wasShown [
	^ wasShown
]

{ #category : #accessing }
SBMessageComponent >> wasShown: anObject [
	wasShown := anObject
]
