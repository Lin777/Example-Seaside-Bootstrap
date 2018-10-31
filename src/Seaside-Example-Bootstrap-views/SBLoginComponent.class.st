Class {
	#name : #SBLoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'email',
		'password',
		'messageComponent'
	],
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #'as yet unclassified' }
SBLoginComponent >> applicationName [

 ^ SBLibrary applicationName

]

{ #category : #accessing }
SBLoginComponent >> email [
	^ email
]

{ #category : #accessing }
SBLoginComponent >> email: anObject [
	email := anObject
]

{ #category : #initialization }
SBLoginComponent >> initialize [
	super initialize.
	self messageComponent: SBMessageComponent new.
]

{ #category : #initialization }
SBLoginComponent >> loginFailed [

 self messageComponent errorMessage: 'Login failed.'.
]

{ #category : #accessing }
SBLoginComponent >> messageComponent [
	^ messageComponent
]

{ #category : #accessing }
SBLoginComponent >> messageComponent: anObject [
	messageComponent := anObject
]

{ #category : #accessing }
SBLoginComponent >> password [
	^ password
]

{ #category : #accessing }
SBLoginComponent >> password: anObject [
	password := anObject
]

{ #category : #initialization }
SBLoginComponent >> registerUser [
 
 self answer: #registerUser.
]

{ #category : #initialization }
SBLoginComponent >> renderContentOn: html [
	html space.
	html div
		class: 'auth-form px-3';
		with: [ html div
				class: 'text-center';
				with: [ html heading
						level: 2;
						with: 'Sign in to ESUG' ].
			html div
				class: 'auth-form-body mt-3 well';
				with: [ html render: self messageComponent.
					html form
						class: 'form-signin';
						with: [ self
								renderEmailInputOn: html;
								renderPasswordInputOn: html;
								renderLoginButtonOn: html;
								renderSignUpAnchorOn: html ] ] ]
]

{ #category : #initialization }
SBLoginComponent >> renderEmailInputOn: html [
	html tbsFormGroup: [ 
		html label for: 'email'; with: 'Email address'.
		html textInput name: 'email'; tbsFormControl; placeholder: 'Enter email'; on: #email of: self.].

]

{ #category : #initialization }
SBLoginComponent >> renderLoginButtonOn: html [
	
	html tbsButton 	
			beSuccess;		 
			beBlock;
			callback: [ self validateLogin ];
			with: 'Sign in'
]

{ #category : #initialization }
SBLoginComponent >> renderPasswordInputOn: html [
	html tbsFormGroup: [ 
		html label for: 'exampleInputPassword1'; with: 'Password'.
		html passwordInput tbsFormControl id: 'exampleInputPassword1'; placeholder: 'Password'; callback: [ :value | self password: (SBUser hashPassword: value) asString ] ].
	
]

{ #category : #initialization }
SBLoginComponent >> renderSignUpAnchorOn: html [
html break.
 html text: 'New to ESUG? '.
	html anchor
  callback: [self registerUser];
  with: [html text: 'Create an account. ']
]

{ #category : #initialization }
SBLoginComponent >> style [
	^ '.auth-form-body {
    padding: 20px;
    font-size: 14px;
    background-color: #fff;
    border: 1px solid #d8dee2;
    border-top-color: initial;
    border-top-style: initial;
    border-top-width: 0px;
    border-right-color: rgb(216, 222, 226);
    border-right-style: solid;
    border-right-width: 1px;
    border-bottom-color: rgb(216, 222, 226);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-left-color: rgb(216, 222, 226);
    border-left-style: solid;
    border-left-width: 1px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    border-top: 0;
    border-radius: 0 0 3px 3px;
}
.mt-3 {
    margin-top: 16px!important;
}
.px-3 {
    padding-right: 16px!important;
    padding-left: 16px!important;
}
.auth-form {
    width: 340px;
    margin: 0 auto;
}
'
]

{ #category : #initialization }
SBLoginComponent >> validateLogin [

 | user |
 user := self session findUserByEmail: self email.
 (user notNil and: [user password = self password])
  ifTrue: [self answer: user]
  ifFalse: [self loginFailed].
]
