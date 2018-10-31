Class {
	#name : #SBRelationalDataBase,
	#superclass : #SBDatabase,
	#instVars : [
		'connection'
	],
	#classVars : [
		'WriteMutex'
	],
	#category : #'Seaside-Example-Bootstrap-BD'
}

{ #category : #'as yet unclassified' }
SBRelationalDataBase class >> connectionArguments [

 ^ PGConnectionArgs
  hostname: self hostname
  portno: self port
  databaseName: self databaseName
  userName: self userName
  password: self password.
]

{ #category : #accessing }
SBRelationalDataBase class >> databaseName [

 ^ 'esug'

]

{ #category : #accessing }
SBRelationalDataBase class >> hostname [

 ^ 'localhost'

]

{ #category : #accessing }
SBRelationalDataBase class >> password [

 ^ 'lin777'

]

{ #category : #accessing }
SBRelationalDataBase class >> port [

 ^ 5432
]

{ #category : #'as yet unclassified' }
SBRelationalDataBase class >> setup [
	self new
		connect ;
		createTables;
		disconnect.
]

{ #category : #accessing }
SBRelationalDataBase class >> userName [

 ^ 'lin777'
]

{ #category : #writing }
SBRelationalDataBase class >> writeMutex [
  
 ^ WriteMutex ifNil: [WriteMutex := Monitor new]
]

{ #category : #adding }
SBRelationalDataBase >> addAditionalInformation: anAditionalInfo toUser: aUser [

 "self class writeMutex critical: ["
  self connection execute:
   'insert into sbaditionalinfo
    (keywords, additionalText, emailuser)
   values
    (''', anAditionalInfo keywords asString, ''',
    ''', anAditionalInfo additionalText asString, ''',
    ''', aUser email asString, ''')'.
	anAditionalInfo id: self lastInsertedAditionalInfoId." ]."
 aUser additionalInfo: anAditionalInfo.
]

{ #category : #adding }
SBRelationalDataBase >> addAfiliationInformation: anAfiliationInfo toUser: aUser [

 "self class writeMutex critical: ["
  self connection execute:
   'insert into sbafiliationinfo
    (organizationname, direction, city, country, province, membership, postal, useremail)
   values
    (''', anAfiliationInfo organizationName asString, ''',
    ''', anAfiliationInfo direction asString, ''',
    ''', anAfiliationInfo city asString, ''',
    ''', anAfiliationInfo country asString, ''',
    ''', anAfiliationInfo province asString, ''',
    ''', anAfiliationInfo membership asString, ''',
    ''', anAfiliationInfo postal asString, ''',
    ''', aUser email asString, ''')'.
	anAfiliationInfo id: self lastInsertedAfiliationInfoId. "]."
 aUser afiliationInfo: anAfiliationInfo.
]

{ #category : #adding }
SBRelationalDataBase >> addConferenceOptions: conferenceOptions toUser: aUser [

 "self class writeMutex critical: ["
  self connection execute:
   'insert into sbconferenceoptions
    (monday, tuesday, wednesday, thursday, friday, tshirtsize, vegetarian, socialevent, addedMainList, useremail)
   values
    (''', conferenceOptions monday asString, ''',
    ''', conferenceOptions tuesday asString, ''',
    ''', conferenceOptions wendsday asString, ''',
    ''', conferenceOptions thursday asString, ''',
    ''', conferenceOptions friday asString, ''',
    ''', conferenceOptions tShirt asString, ''',
    ''', conferenceOptions vegetarian asString, ''',
    ''', conferenceOptions socialEvent asString, ''',
    ''', conferenceOptions addedMainList asString, ''',
    ''', aUser email asString, ''')'.
	conferenceOptions id: self lastInsertedConferenceOptionsId. "]."
 aUser conferenceOptions: conferenceOptions.
]

{ #category : #adding }
SBRelationalDataBase >> addContactInfo: aContactInfo toUser: aUser [

 "self class writeMutex critical: ["
  self connection execute:
   'insert into sbcontactinfo
    (direction, city, country, province, postal, facebook, twiter, homepage, useremail)
   values
    (''', aContactInfo direction asString, ''',
    ''', aContactInfo city asString, ''',
    ''', aContactInfo country asString, ''',
    ''', aContactInfo province asString, ''',
    ''', aContactInfo postal asString, ''',
    ''', aContactInfo facebook asString, ''',
    ''', aContactInfo twitter asString, ''',
    ''', aContactInfo homePage asString, ''',
    ''', aUser email asString, ''')'.
	aContactInfo id: self lastInsertedContactInfoId. "]."
 aUser contactInfo: aContactInfo.
]

{ #category : #adding }
SBRelationalDataBase >> addPaymentInformation: aPaymentInfo toUser: aUser [

 "self class writeMutex critical: ["
  self connection execute:
   'insert into sbpaymentinfo
    (paymentmethod, currency, paymenttype, emailuser)
   values
    (''', aPaymentInfo paymentMethod asString, ''',
    ''', aPaymentInfo currency asString, ''',
    ''', aPaymentInfo paymentType asString, ''',
    ''', aUser email asString, ''')'.
	aPaymentInfo id: self lastInsertedPaymentInfoId. "]."
 aUser paymentInfo: aPaymentInfo.
]

{ #category : #adding }
SBRelationalDataBase >> addUser: aUser [
self class writeMutex critical: [
 self connection execute:
  'insert into sbuser (email, password, firstname, lastname)
  values
   (''', aUser email asString,''',
   ''', aUser password asString,''',
   ''', aUser firstName asString,''',
   ''', aUser lastName asString,''');'.
self addAditionalInformation: aUser additionalInfo toUser: aUser.
self addAfiliationInformation: aUser afiliationInfo toUser: aUser.
self addConferenceOptions: aUser conferenceOptions toUser: aUser.
self addContactInfo: aUser contactInfo toUser: aUser.
self addPaymentInformation: aUser paymentInfo toUser: aUser.
]
]

{ #category : #adding }
SBRelationalDataBase >> connect [

 self connection: (PGConnection new
  connectionArgs: self class connectionArguments;
  startup;
  yourself).
]

{ #category : #adding }
SBRelationalDataBase >> connection [
	^ connection
]

{ #category : #adding }
SBRelationalDataBase >> connection: anObject [
	connection := anObject
]

{ #category : #adding }
SBRelationalDataBase >> connectionFailed [

 ^ self connection isNil or: [self connection isConnected not]
]

{ #category : #adding }
SBRelationalDataBase >> createAditionalInfoTable [
	self connection execute:
  'CREATE TABLE sbaditionalinfo (
  id serial PRIMARY KEY,
emailuser varchar(50) references sbuser(email) NOT NULL,
  keywords varchar(200),
  additionalText varchar(250));'.
]

{ #category : #adding }
SBRelationalDataBase >> createAfiliationInfoTable [
	
 self connection execute:
  'CREATE TABLE sbafiliationinfo (
	id serial PRIMARY KEY,
	useremail varchar(50) references sbuser(email) NOT NULL,
  organizationname varchar(50),
  direction varchar(50),
  city varchar(50),
  country varchar(50),
province varchar(50),
postal varchar(30),
membership varchar(50)  );'.
]

{ #category : #adding }
SBRelationalDataBase >> createConferenceOptionsTable [
self connection execute:
  'CREATE TABLE sbconferenceoptions (
  id serial PRIMARY KEY,
	useremail varchar(50) references sbuser(email) NOT NULL,
  monday boolean NOT NULL,
  tuesday boolean NOT NULL,
  wednesday boolean NOT NULL,
  thursday boolean NOT NULL,
  friday boolean NOT NULL,
  tshirtsize varchar(30),
  vegetarian boolean NOT NULL,
  socialevent boolean NOT NULL,
  addedMainList boolean NOT NULL);'.
]

{ #category : #adding }
SBRelationalDataBase >> createContanctInfoTable [
	
 self connection execute:
  'CREATE TABLE sbcontactinfo (
  id serial PRIMARY KEY,
	useremail varchar(50) references sbuser(email) NOT NULL,
  direction varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  country varchar(50) NOT NULL,
  province varchar(50) NOT NULL,
  postal varchar(50) NOT NULL,
  facebook varchar(50),
  twiter varchar(50),
  homepage varchar(50));'.
]

{ #category : #adding }
SBRelationalDataBase >> createNewsTable [
	self connection execute:
  'CREATE TABLE sbnews (
  id serial PRIMARY KEY,
  title varchar(200),
  description varchar(450));'.
]

{ #category : #adding }
SBRelationalDataBase >> createPaymentInfoTable [
	self connection execute:
  'CREATE TABLE sbpaymentinfo (
  id serial PRIMARY KEY,
emailuser varchar(50) references sbuser(email) NOT NULL,
 paymentmethod varchar(50) NOT NULL,
  currency varchar(30),
  paymenttype varchar(30));'.
]

{ #category : #adding }
SBRelationalDataBase >> createTables [

 self
  createUserTable;
  createAfiliationInfoTable;
	createContanctInfoTable;
	createConferenceOptionsTable;
	createAditionalInfoTable;
	createPaymentInfoTable;
	createNewsTable
]

{ #category : #adding }
SBRelationalDataBase >> createUserTable [
	
 self connection execute:
  'CREATE TABLE sbuser (
  firstname varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  email varchar(50) NOT NULL PRIMARY KEY);'.
]

{ #category : #adding }
SBRelationalDataBase >> disconnect [

 (self connection notNil and: [self connection isConnected])
  ifTrue: [self connection terminate].
]

{ #category : #adding }
SBRelationalDataBase >> findUserByEmail: aString [

 | user |
 user := self retrieveUserByEmail: aString.
 user ifNotNil: [ | aditionalInfo afiliationInfo conferenceOptions contactInfo paymentInfo |
  aditionalInfo := self retrieveAditionalInfoByUsersEmail: aString.
  user additionalInfo: aditionalInfo. 
  afiliationInfo := self retrieveAfiliationInfoByUsersEmail: aString.
  user afiliationInfo: afiliationInfo.
  conferenceOptions := self retrieveConferenceOptionsByUsersEmail: aString.
  user conferenceOptions: conferenceOptions.
  contactInfo := self retrieveContactInfoByUsersEmail: aString.
  user contactInfo: contactInfo.
  paymentInfo := self retrievePaymentInfoByUsersEmail: aString.
  user paymentInfo: paymentInfo.].
 ^ user
]

{ #category : #adding }
SBRelationalDataBase >> initialize [

 super initialize.
 self connect.
]

{ #category : #adding }
SBRelationalDataBase >> lastInsertedAditionalInfoId [
	| result |
	result := self connection
		execute: 'select currval(pg_get_serial_sequence(''sbaditionalinfo' , '''id''));'.
	^ result errorResponse
		ifNil: [ result resultSets first dataRows first at: 1 ]
]

{ #category : #adding }
SBRelationalDataBase >> lastInsertedAfiliationInfoId [
	| result |
	result := self connection
		execute: 'select currval(pg_get_serial_sequence(''sbafiliationinfo' , '''id''));'.
	^ result errorResponse
		ifNil: [ result resultSets first dataRows first at: 1 ]
]

{ #category : #adding }
SBRelationalDataBase >> lastInsertedConferenceOptionsId [
	| result |
	result := self connection
		execute: 'select currval(pg_get_serial_sequence(''sbconferenceoptions' , '''id''));'.
	^ result errorResponse
		ifNil: [ result resultSets first dataRows first at: 1 ]
]

{ #category : #adding }
SBRelationalDataBase >> lastInsertedContactInfoId [
	| result |
	result := self connection
		execute: 'select currval(pg_get_serial_sequence(''sbcontactinfo' , '''id''));'.
	^ result errorResponse
		ifNil: [ result resultSets first dataRows first at: 1 ]
]

{ #category : #adding }
SBRelationalDataBase >> lastInsertedPaymentInfoId [
	| result |
	result := self connection
		execute: 'select currval(pg_get_serial_sequence(''sbpaymentinfo' , '''id''));'.
	^ result errorResponse
		ifNil: [ result resultSets first dataRows first at: 1 ]
]

{ #category : #adding }
SBRelationalDataBase >> retrieveAditionalInfoByUsersEmail: aString [

 | resultSet |
 resultSet := self connection execute:
  'select * from sbaditionalinfo where emailuser=''', aString, ''';'.
 ^ resultSet
  ifNil: [SBAdditionalInformation new]
  ifNotNil: [:aditionalInfo| aditionalInfo dataRows collect: [:each | SBAdditionalInformation newFromDataRow: each]]
]

{ #category : #adding }
SBRelationalDataBase >> retrieveAfiliationInfoByUsersEmail: aString [

 | resultSet |
 resultSet := self connection execute:
  'select * from sbafiliationinfo where useremail=''', aString, ''';'.
 ^ resultSet
  ifNil: [SBAfiliationInformation new]
  ifNotNil: [:aditionalInfo| aditionalInfo dataRows collect: [:each | SBAfiliationInformation  newFromDataRow: each]]
]

{ #category : #adding }
SBRelationalDataBase >> retrieveConferenceOptionsByUsersEmail: aString [

 | resultSet |
 resultSet := self connection execute:
  'select * from sbconferenceoptions where useremail=''', aString, ''';'.
 ^ resultSet
  ifNil: [SBConferenceOptions  new]
  ifNotNil: [:afiliationInfo| afiliationInfo dataRows collect: [:each | SBConferenceOptions  newFromDataRow: each]]
]

{ #category : #adding }
SBRelationalDataBase >> retrieveContactInfoByUsersEmail: aString [

 | resultSet |
 resultSet := self connection execute:
  'select * from sbcontactinfo where useremail=''', aString, ''';'.
 ^ resultSet
  ifNil: [SBContactInformation   new]
  ifNotNil: [:afiliationInfo| afiliationInfo dataRows collect: [:each | SBContactInformation  newFromDataRow: each]]
]

{ #category : #adding }
SBRelationalDataBase >> retrieveNews [

 | resultSet |
 resultSet := self connection execute:
  'select * from sbnews;'.
 ^ resultSet
  ifNil: [OrderedCollection  new]
  ifNotNil: [:afiliationInfo| afiliationInfo dataRows collect: [:each | SBNews  newFromDataRow: each]]
]

{ #category : #adding }
SBRelationalDataBase >> retrievePaymentInfoByUsersEmail: aString [

 | resultSet |
 resultSet := self connection execute:
  'select * from sbpaymentinfo where emailuser=''', aString, ''';'.
 ^ resultSet
  ifNil: [SBPaymentInformation  new]
  ifNotNil: [:afiliationInfo| afiliationInfo dataRows collect: [:each | SBPaymentInformation  newFromDataRow: each]]
]

{ #category : #adding }
SBRelationalDataBase >> retrieveUserByEmail: aString [

 | resultSet |
 resultSet := self connection execute:
  'select * from sbuser where email=''', aString, ''';'.
 ^ SBUser newFromResultSet: resultSet
]
