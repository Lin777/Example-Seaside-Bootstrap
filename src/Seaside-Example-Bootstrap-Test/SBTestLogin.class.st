Class {
	#name : #SBTestLogin,
	#superclass : #TestCase,
	#instVars : [
		'driver'
	],
	#category : #'Seaside-Example-Bootstrap-Test'
}

{ #category : #accessing }
SBTestLogin >> baseURL [
	^ 'http://localhost:8080/ESUG/'
]

{ #category : #accessing }
SBTestLogin >> setUp [
	driver := BPRemoteWebDriver withCapabilities: BPDesiredCapabilities chrome.
	driver get: self baseURL 
]

{ #category : #accessing }
SBTestLogin >> tearDown [
	driver quit
]

{ #category : #accessing }
SBTestLogin >> testLoginRegisteredUser [
	|email password signIn|
	email := driver findElementByName: '1'.
	password := driver findElementByName: '2'.
	signIn := driver findElementByName: '3'.
	email sendKeys: 'gary@gmail.com'.
	password sendKeys: '1234'.
	signIn click .
	self assert: (driver findElementByLinkText: 'Logout') getText = 'Logout'.
]

{ #category : #accessing }
SBTestLogin >> testLoginUnregisteredUser [
	|email password signIn message|
	email := driver findElementByName: '1'.
	password := driver findElementByName: '2'.
	signIn := driver findElementByName: '3'.
	email sendKeys: 'noValid@gmail.com'.
	password sendKeys: '1234'.
	signIn click .
	message := driver findElementByName: 'message'.
	self assert: message  getText = 'Login failed.'.
]

{ #category : #accessing }
SBTestLogin >> testRegister [
	|linkCreate|
	linkCreate := driver findElementByLinkText: 'Create an account.'.
	linkCreate click .
	
]

{ #category : #accessing }
SBTestLogin >> testRegisterUser [
	|linkCreate divForm data dataRegister register message|
	data := #('luis@gmail.com' 'Luis' 'Sandoval' '1234' '1234').
	linkCreate := driver findElementByLinkText: 'Create an account.'.
	linkCreate click .
	divForm := driver findElementByTagName: 'body'.
	dataRegister := ''.
	data do: [ :each | dataRegister := dataRegister , (BPKeys tab) asString, each ].
	divForm sendKeys: 	(BPKeys tab) asString, (BPKeys return) asString, dataRegister.
	register := driver findElementByID: 'register'.
	register click.
	BPTimeouts new implicitlyWait: 5.
	message := driver findElementByName: 'message'.
	self assert: (message getText) = 'Please enter your Address!' .
	"divForm sendKeys: 	(BPKeys tab) asString, 'Evelyn', (BPKeys tab) asString  .
	nameInput := driver findElementByID: 'email'.
	self assert: (nameInput getAttribute: 'placeholder') = 'Enter email'"
]
