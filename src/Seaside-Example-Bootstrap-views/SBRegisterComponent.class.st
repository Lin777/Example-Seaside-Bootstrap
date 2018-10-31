Class {
	#name : #SBRegisterComponent,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'aditionalInfo',
		'afiliationInfo',
		'conferenceOptions',
		'contactInfo',
		'paymentInfo',
		'repeatedPassword',
		'messageComponent',
		'accordion'
	],
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #accessing }
SBRegisterComponent >> accordion [
	^ accordion
]

{ #category : #accessing }
SBRegisterComponent >> accordion: anObject [
	accordion := anObject
]

{ #category : #accessing }
SBRegisterComponent >> aditionalInfo [
	^ aditionalInfo
]

{ #category : #accessing }
SBRegisterComponent >> aditionalInfo: anObject [
	aditionalInfo := anObject
]

{ #category : #accessing }
SBRegisterComponent >> afiliationInfo [
	^ afiliationInfo
]

{ #category : #accessing }
SBRegisterComponent >> afiliationInfo: anObject [
	afiliationInfo := anObject
]

{ #category : #'as yet unclassified' }
SBRegisterComponent >> collapseAllExceptAdditionalInfo [
	self collapseAllExceptaTitle: 'Additional information'.
]

{ #category : #'as yet unclassified' }
SBRegisterComponent >> collapseAllExceptAffiliationInfo [
	self collapseAllExceptaTitle: 'Affiliation information'.
]

{ #category : #'as yet unclassified' }
SBRegisterComponent >> collapseAllExceptConferenceOptions [
	self collapseAllExceptaTitle: 'Conference options'.
]

{ #category : #'as yet unclassified' }
SBRegisterComponent >> collapseAllExceptContactInfo [
	self collapseAllExceptaTitle: 'Contact information'.
]

{ #category : #'as yet unclassified' }
SBRegisterComponent >> collapseAllExceptPaymentInfo [
	self collapseAllExceptaTitle: 'Payment information'.
]

{ #category : #'as yet unclassified' }
SBRegisterComponent >> collapseAllExceptUserInfo [
	self collapseAllExceptaTitle: 'User information'.
]

{ #category : #'as yet unclassified' }
SBRegisterComponent >> collapseAllExceptaTitle: aTitle [
	accordion items
		do: [ :each | 
			each title = aTitle
				ifTrue: [ each isCollapsed: false ]
				ifFalse: [ each isCollapsed: true ] ]
]

{ #category : #accessing }
SBRegisterComponent >> conferenceOptions [
	^ conferenceOptions
]

{ #category : #accessing }
SBRegisterComponent >> conferenceOptions: anObject [
	conferenceOptions := anObject
]

{ #category : #accessing }
SBRegisterComponent >> contactInfo [
	^ contactInfo
]

{ #category : #accessing }
SBRegisterComponent >> contactInfo: anObject [
	contactInfo := anObject
]

{ #category : #accessing }
SBRegisterComponent >> initialize [
	super initialize.
	self user: SBUser new.
	self contactInfo: SBContactInformation new.
	self conferenceOptions: SBConferenceOptions new.
	self afiliationInfo: SBAfiliationInformation new.
	self aditionalInfo: SBAdditionalInformation new.
	self paymentInfo: SBPaymentInformation new.
	self messageComponent: SBMessageComponent new.
	accordion := TBSAccordion new.
	accordion 

		add: [ :html | self renderUserInformation: html ] title: 'User information';
		add: [ :html | self renderContactInformation: html ] title: 'Contact information';
		add: [ :html | self renderConferenceOptions: html ] title: 'Conference options';
		add: [ :html | self renderAffiliationInformation: html ] title: 'Affiliation information';
		add: [ :html | self renderAditionalInformation: html ] title: 'Additional information';
		add: [ :html | self  renderPaymentInformation: html] title: 'Payment information'.
	accordion items do: [ :each | each isCollapsed: true]
]

{ #category : #accessing }
SBRegisterComponent >> messageComponent [
	^ messageComponent
]

{ #category : #accessing }
SBRegisterComponent >> messageComponent: anObject [
	messageComponent := anObject
]

{ #category : #accessing }
SBRegisterComponent >> paymentInfo [
	^ paymentInfo
]

{ #category : #accessing }
SBRegisterComponent >> paymentInfo: anObject [
	paymentInfo := anObject
]

{ #category : #accessing }
SBRegisterComponent >> registerAditionalInfo [
	^ nil
]

{ #category : #accessing }
SBRegisterComponent >> registerAffiliarionInfo [

 self afiliationInfo organizationName isEmptyOrNil
  ifTrue: [self collapseAllExceptAffiliationInfo .^ self messageComponent 
   infoMessage: 'Please enter your Organization name!'].
 self afiliationInfo direction isEmptyOrNil
  ifTrue: [self collapseAllExceptAffiliationInfo .^ self messageComponent 
   infoMessage: 'Please enter your Address!'].
 self afiliationInfo city isEmptyOrNil
  ifTrue: [self collapseAllExceptAffiliationInfo .^ self messageComponent 
   infoMessage: 'Please enter your City!'].
 self afiliationInfo country isEmptyOrNil
  ifTrue: [self collapseAllExceptAffiliationInfo .^ self messageComponent 
   infoMessage: 'Please enter your Country!'].
 self afiliationInfo province isEmptyOrNil
  ifTrue: [self collapseAllExceptAffiliationInfo .^ self messageComponent 
   infoMessage: 'Please enter your Province or State!'].
 self afiliationInfo postal isEmptyOrNil
  ifTrue: [self collapseAllExceptAffiliationInfo .^ self messageComponent 
   infoMessage: 'Please enter your Postal or Zip code!'].
^ nil
]

{ #category : #accessing }
SBRegisterComponent >> registerConferenceOptions [
	^ nil
]

{ #category : #accessing }
SBRegisterComponent >> registerContactInfo [
	self contactInfo direction isEmptyOrNil
		ifTrue: [ self collapseAllExceptContactInfo.
			^ self messageComponent
				infoMessage: 'Please enter your Address!' ].
	self contactInfo city isEmptyOrNil
		ifTrue: [ self collapseAllExceptContactInfo.
			^ self messageComponent
				infoMessage: 'Please enter your City!' ].
	self contactInfo country isEmptyOrNil
		ifTrue: [ self collapseAllExceptContactInfo.
			^ self messageComponent
				infoMessage: 'Please enter your Country!' ].
	self contactInfo province isEmptyOrNil
		ifTrue: [ self collapseAllExceptContactInfo.
			^ self messageComponent
				infoMessage: 'Please enter your Province or State!' ].
	self contactInfo postal isEmptyOrNil
		ifTrue: [ self collapseAllExceptContactInfo.
			^ self messageComponent
				infoMessage: 'Please enter your Postal or Zip code!' ].
	^ nil
]

{ #category : #accessing }
SBRegisterComponent >> registerPaymentInfo [
	self paymentInfo paymentMethod isEmptyOrNil
		ifTrue: [ self collapseAllExceptPaymentInfo.
			^ self messageComponent
				infoMessage: 'Please enter your Number ticket!' ].
	^ nil
]

{ #category : #accessing }
SBRegisterComponent >> registerUser [
	| aUser aContactInfo aConferenceOptions anAfiliationInfo anAdditionalInfo aPaymentInfo |
	"self halt."
	aUser := self registerUserInformation.
	aUser isNil
		ifFalse: [ ^ aUser ].
	aContactInfo := self registerContactInfo.
	aContactInfo isNil
		ifFalse: [ ^ aContactInfo ].
	self user contactInfo: self contactInfo.
	aConferenceOptions := self registerConferenceOptions.
	aConferenceOptions isNil
		ifFalse: [ ^ aConferenceOptions ].
	self user conferenceOptions: self conferenceOptions.
	anAfiliationInfo := self registerAffiliarionInfo.
	anAfiliationInfo isNil
		ifFalse: [ ^ anAfiliationInfo ].
	self user afiliationInfo: self afiliationInfo.
	anAdditionalInfo := self registerAditionalInfo.
	anAdditionalInfo isNil
		ifFalse: [ ^ anAdditionalInfo ].
	self user additionalInfo: self aditionalInfo.
	aPaymentInfo := self registerPaymentInfo.
	aPaymentInfo isNil
		ifFalse: [ ^ aPaymentInfo ].
	self user paymentInfo: self paymentInfo.
	self session database addUser: self user.
	self answer: self user
]

{ #category : #accessing }
SBRegisterComponent >> registerUserInformation [
	self user email isEmptyOrNil
		ifTrue: [ self collapseAllExceptUserInfo.
			^ self messageComponent
				infoMessage: 'Please enter your e-mail address!' ].
	self user firstName isEmptyOrNil
		ifTrue: [ self collapseAllExceptUserInfo.
			^ self messageComponent
				infoMessage: 'Please enter your first name!' ].
	self user lastName isEmptyOrNil
		ifTrue: [ self collapseAllExceptUserInfo.
			^ self messageComponent
				infoMessage: 'Please enter your last name!' ].
	(self session findUserByEmail: self user email)
		ifNotNil: [ self collapseAllExceptUserInfo.
			^ self messageComponent
				errorMessage: 'The e-mail address is already registered!' ].
	self user password = 0
		ifTrue: [ self collapseAllExceptUserInfo.
			^ self messageComponent
				infoMessage: 'Please choose a password!' ].
	self user password = self repeatedPassword
		ifFalse: [ self collapseAllExceptUserInfo.
			^ self messageComponent
				infoMessage: 'Your repeated password does not match!' ].
	^ nil
]

{ #category : #accessing }
SBRegisterComponent >> renderAditionalInformation: html [
			html
				table: [
 html tableRow: [
html tbsFormGroup: [ 
		html label for: 'keywords'; with: 'Keywords'.
		html textInput tbsFormControl; id: 'keywords'; 
		callback: [:value | self aditionalInfo keywords: value]; 
		value: self aditionalInfo keywords; placeholder: 'Keywords']].

html tableRow: [  
html tbsFormGroup: [ 
		html label for: 'additionalText'; with: 'Additional Text'.
		html textArea tbsFormControl; id: 'additionalText'; 
		callback: [:value | self aditionalInfo additionalText: value]; 
		value: self aditionalInfo additionalText; placeholder: 'Additional Text']]]
]

{ #category : #accessing }
SBRegisterComponent >> renderAffiliationInformation: html [
	html
				tableRow: [ html
						tbsFormGroup: [ html label
								for: 'organizationName';
								with: 'Organization name'.
							html textInput
								tbsFormControl;
								id: 'organizationName';
								callback: [ :value | self afiliationInfo organizationName: value ];
								value: self afiliationInfo organizationName;
								placeholder: 'Organization name' ] ].
			html
				tableRow: [ html
						tbsFormGroup: [ html label
								for: 'direction';
								with: 'Address'.
							html textInput
								tbsFormControl;
								id: 'direction';
								callback: [ :value | self afiliationInfo direction: value ];
								value: self afiliationInfo direction;
								placeholder: 'Address' ] ].
			html
				tableRow: [ html
						tbsFormGroup: [ html label
								for: 'city';
								with: 'City'.
							html textInput
								tbsFormControl;
								id: 'city';
								callback: [ :value | self afiliationInfo city: value ];
								value: self afiliationInfo city;
								placeholder: 'City' ] ].
			html
				tableRow: [ html
						tbsFormGroup: [ html label
								for: 'country';
								with: 'Country'.
							html textInput
								tbsFormControl;
								id: 'country';
								callback: [ :value | self afiliationInfo country: value ];
								value: self afiliationInfo country;
								placeholder: 'Country' ] ].
			html
				tableRow: [ html
						tbsFormGroup: [ html label
								for: 'province';
								with: 'Province / State'.
							html textInput
								tbsFormControl;
								id: 'province';
								callback: [ :value | self afiliationInfo province: value ];
								value: self afiliationInfo province;
								placeholder: 'Province / State' ] ].
			html
				tableRow: [ html
						tbsFormGroup: [ html label
								for: 'postal';
								with: 'Postal / Zip code'.
							html textInput
								tbsFormControl;
								id: 'postal';
								callback: [ :value | self afiliationInfo postal: value ];
								value: self afiliationInfo postal;
								placeholder: 'Postal / Zip code' ] ].
			html
				tableRow: [ html
						tbsFormGroup: [ html label
								for: 'exampleInputEmail1';
								with: 'Membership'.
							html select
								list: #(#Industrial #Other #ProfessorResearcher #Student);
								selected: self afiliationInfo membership;
								callback: [ :value | self afiliationInfo membership: value ].
							html break ] ] 
]

{ #category : #accessing }
SBRegisterComponent >> renderCancelButtonOn: html [
html tbsButton 
			beDefault;
			callback: [ self answer:nil ];
			with: 'Cancel'. 

]

{ #category : #accessing }
SBRegisterComponent >> renderConferenceOptions: html [
	html
				table: [
 html tableRow: [
html tbsFormGroup: [ 

		html label with: 'Check the dates you will attend (Required)'.
		html div class: 'checkbox'; with: [html label: [html checkbox callback: [:value | self conferenceOptions monday: value]. html text: ' Monday 10' ]].
		html div class: 'checkbox'; with: [html label: [html checkbox callback: [:value | self conferenceOptions tuesday: value]. html text: ' Tuesday 11' ]].
		html div class: 'checkbox'; with: [html label: [html checkbox callback: [:value | self conferenceOptions wendsday: value]. html text: ' Wednesday 12' ]].
		html div class: 'checkbox'; with: [html label: [html checkbox callback: [:value | self conferenceOptions thursday: value]. html text: ' Thursday 13' ]].
		html div class: 'checkbox'; with: [html label: [html checkbox callback: [:value | self conferenceOptions friday: value]. html text: ' Friday 14' ]].
		]].

html tableRow: [  
html tbsFormGroup: [ 
		html label with: 'TShirt Size'.
		html select
				list: #(#Small #Medium #Large #XL #XXL #NoThanks);
				selected: #Small;
				callback: [:value | self conferenceOptions tShirt: value].
		html break.
]].

 html tableRow: [  
html tbsFormGroup: [ 
		html div class: 'checkbox'; with: [html label: [html checkbox callback: [:value | self conferenceOptions vegetarian: value]. html text: ' Check if you are vegetarian' ]].]].
 html tableRow: [  
html tbsFormGroup: [ 
		html div class: 'checkbox'; with: [html label: [html checkbox callback: [:value | self conferenceOptions socialEvent: value]. html text: ' Check if you will you go to the Social Event' ]].]].

 html tableRow: [  
html tbsFormGroup: [ 
		html div class: 'checkbox'; with: [html label: [html checkbox callback: [:value | self conferenceOptions addedMainList: value]. html text: ' Check if you want to be added to the Mailing List' ]].]].
]

]

{ #category : #accessing }
SBRegisterComponent >> renderContactInformation: html [
	html
				table: [
 html tableRow: [
html tbsFormGroup: [ 
		html label for: 'direction1'; with: 'Address'.
		html textInput tbsFormControl; id: 'direction1'; 
		callback: [:value | self contactInfo direction: value]; 
		value: self contactInfo direction; placeholder: 'Address']].

html tableRow: [  
html tbsFormGroup: [ 
		html label for: 'city1'; with: 'City'.
		html textInput tbsFormControl; id: 'city1'; 
		callback: [:value | self contactInfo city: value]; 
		value: self contactInfo city; placeholder: 'City']].

 html tableRow: [  
html tbsFormGroup: [ 
		html label for: 'country1'; with: 'Country'.
		html textInput tbsFormControl; id: 'country1'; 
		callback: [:value | self contactInfo country: value]; 
		value: self contactInfo country; placeholder: 'Country']].

html tableRow: [  
html tbsFormGroup: [ 
		html label for: 'province1'; with: 'Province / State'.
		html textInput tbsFormControl; id: 'province1'; 
		callback: [:value | self contactInfo province: value]; 
		value: self contactInfo province; placeholder: 'Province / State']].

html tableRow: [  
html tbsFormGroup: [ 
		html label for: 'postal1'; with: 'Postal / Zip code'.
		html textInput tbsFormControl; id: 'postal1'; 
		callback: [:value | self contactInfo postal: value]; 
		value: self contactInfo postal; placeholder: 'Postal / Zip code']].

html tableRow: [  
html tbsFormGroup: [ 
		html label for: 'facebook'; with: 'Facebook url'.
		html textInput tbsFormControl; id: 'facebook'; 
		callback: [:value | self contactInfo facebook: value]; 
		value: self contactInfo facebook; placeholder: 'Facebook url']].

html tableRow: [  
html tbsFormGroup: [ 
		html label for: 'twitter'; with: 'Twitter url'.
		html textInput tbsFormControl; id: 'twitter'; 
		callback: [:value | self contactInfo twitter: value]; 
		value: self contactInfo twitter; placeholder: 'Twitter url']].

html tableRow: [  
html tbsFormGroup: [ 
		html label for: 'homePage'; with: 'Home page url'.
		html textInput tbsFormControl; id: 'homePage'; 
		callback: [:value | self contactInfo homePage: value]; 
		value: self contactInfo homePage; placeholder: 'Home page url']].
]
]

{ #category : #accessing }
SBRegisterComponent >> renderContentOn: html [
	html break.
	html tbsContainer id: 'register'; with: [html tbsPanel beDefault 
		with: [ 
			html tbsContainer:[html
				heading level:2; with: 'Register to ESUG'.
				html render: self messageComponent.
				html
		form: [html render: accordion.
				html
						tableRow: [ html
								tableData;
								tableData: [ self renderSubmitButtonOn: html.
									html space.
									self renderCancelButtonOn: html ] ].
						].
					html break.]]]
]

{ #category : #accessing }
SBRegisterComponent >> renderEmailTextInputOn: html [

 html tableRow: [
  
html tbsFormGroup: [ 
		html label for: 'email'; with: 'Email address'.
		html textInput tbsFormControl; id: 'email'; 
		callback: [:value | self user email: value]; 
		value: self user email; placeholder: 'Enter email']]
]

{ #category : #accessing }
SBRegisterComponent >> renderFirstNameTextInputOn: html [

html tableRow:  [  
html tbsFormGroup: [ 
		html label for: 'firstName'; with: 'First name'.
		html textInput tbsFormControl; id: 'firstName'; placeholder: 'First name'; callback: [:value | self user firstName: value];
    value: self user firstName]]
]

{ #category : #accessing }
SBRegisterComponent >> renderLastNameTextInputOn: html [

 html tableRow: [

html tbsFormGroup: [ 
		html label for: 'lastName'; with: 'Last name'.
		html textInput tbsFormControl; id: 'lastName'; placeholder: 'Last name'; callback: [:value | self user lastName: value];
    value: self user lastName]]
]

{ #category : #accessing }
SBRegisterComponent >> renderPasswordTextInputOn: html [

 html tableRow: [
html tbsFormGroup: [ 
		html label for: 'password1'; with: 'Password'.
		html passwordInput tbsFormControl id: 'password1'; placeholder: 'Password'; callback: [:value | self user password: (SBUser hashPassword: value)] ]]
]

{ #category : #accessing }
SBRegisterComponent >> renderPaymentInformation: html [
	html
				table: [
					html tableRow: [ html text: 'Pay by bank transfer or paypal/card. Pay in euros.'.
						html break.
html text: 'IMPORTANT: Bank transfers should mention "ESUG" & the registrant name(s) as a comment (e.g. "ESUG John Johnson")'.
html break.
html text: 'Use the inter-country IBAN / BIC data (may need to ask your bank to process the payment).' ].
html tableRow: [  
html tbsFormGroup: [ 
		html label for: 'exampleInputEmail1'; with: 'Payment type'.
		html select
				list: #(#BankTransfer #CreditCard);
				selected: self paymentInfo paymentType;
				callback: [:value | self paymentInfo paymentType: value].
		html break.
		]].
 
html tableRow: [
html tbsFormGroup: [ 
		html label for: 'paymentMethod'; with: 'Reduction ticket code'.
		html textInput tbsFormControl; id: 'paymentMethod'; 
		callback: [:value | self paymentInfo paymentMethod: value]; 
		value: self paymentInfo paymentMethod; placeholder: 'Reduction ticket code']].
html tableRow: [  
html tbsFormGroup: [ 
		html label with: 'Payment Currency'.
		html select
				list: #(#Euro #Dollar);
				selected: self paymentInfo currency;
				callback: [:value | self paymentInfo currency: value].
		html break.
		]].
]
]

{ #category : #accessing }
SBRegisterComponent >> renderRepeatedPasswordTextInputOn: html [

 html tableRow: [
html tbsFormGroup: [ 
		html label for: 'password2'; with: 'Confirm password'.
		html passwordInput tbsFormControl id: 'password2'; placeholder: 'Password'; callback: [:value | self repeatedPassword: (SBUser hashPassword: value)] ]]
]

{ #category : #accessing }
SBRegisterComponent >> renderSubmitButtonOn: html [

html tbsButton 
			beDefault; id: 'register';
			callback: [ self registerUser ];
			with: 'Register'. 

]

{ #category : #accessing }
SBRegisterComponent >> renderUserInformation: html [
	
			html
				table: [ self
						renderEmailTextInputOn: html;
						renderFirstNameTextInputOn: html;
						renderLastNameTextInputOn: html;
						renderPasswordTextInputOn: html;
						renderRepeatedPasswordTextInputOn: html.].
					 
]

{ #category : #accessing }
SBRegisterComponent >> repeatedPassword [
	^ repeatedPassword
]

{ #category : #accessing }
SBRegisterComponent >> repeatedPassword: anObject [
	repeatedPassword := anObject
]

{ #category : #accessing }
SBRegisterComponent >> user [
	^ user
]

{ #category : #accessing }
SBRegisterComponent >> user: anObject [
	user := anObject
]
