Class {
	#name : #SBRootTask,
	#superclass : #WATask,
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #testing }
SBRootTask class >> canBeRoot [

 ^true
]

{ #category : #testing }
SBRootTask class >> initialize [
	"self initialize"
 (WAAdmin
  register: self
  asApplicationAt: 'ESUG')
	addLibrary: JQDeploymentLibrary;
   addLibrary: TBSDeploymentLibrary;
  "addLibrary: PTDevelopmentLibrary;
  addLibrary: SUDevelopmentLibrary;"
  addLibrary: SBLibrary ;
  preferenceAt: #sessionClass put: SBSession
]

{ #category : #running }
SBRootTask >> go [

 | loginAnswer user |
 loginAnswer := self call: SBLoginComponent new.
 loginAnswer = #registerUser
  ifTrue: [user := self call: SBRegisterComponent new]
  ifFalse: [user := loginAnswer].
 user ifNotNil: [
  self session login: user.
  self call: SBLoggedInComponent new].
]
