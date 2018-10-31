Class {
	#name : #SBLoggedInComponent,
	#superclass : #WAComponent,
	#instVars : [
		'navBarComponent',
		'pageContent'
	],
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #initialization }
SBLoggedInComponent >> children [
 
 ^ Array with: navBarComponent; with: pageContent
]

{ #category : #initialization }
SBLoggedInComponent >> initialize [
	super initialize .	
	self initializeNavBarComponent.
	self pageContent: SBHomePage new.
]

{ #category : #initialization }
SBLoggedInComponent >> initializeNavBarComponent [
	self navBarComponent: (SBNavBarComponent new
		addEntry: 'ESUG' withAction: [ self pageContent: SBHomePage new ];
		addEntry: 'About Us' withAction: [ self pageContent: SBAboutUsPage new ];
		addEntry: 'Conference' withAction: [ self pageContent: SBConferencePage new ];
		addEntry: 'Promotion' withAction: [ self pageContent: SBPromotionPage new ];
		addEntry: 'Smalltalk' withAction: [ self pageContent: SBSmalltalk new ]; 
		logoutAction: [self session logout. self answer: true];
		yourself )
]

{ #category : #accessing }
SBLoggedInComponent >> navBarComponent [
	^ navBarComponent
]

{ #category : #accessing }
SBLoggedInComponent >> navBarComponent: anObject [
	navBarComponent := anObject
]

{ #category : #accessing }
SBLoggedInComponent >> pageContent [
	^ pageContent
]

{ #category : #accessing }
SBLoggedInComponent >> pageContent: anObject [
	pageContent := anObject
]

{ #category : #rendering }
SBLoggedInComponent >> renderContentOn: html [
	self renderNavBar: html.
	html render: pageContent .
	self renderFooter: html
]

{ #category : #rendering }
SBLoggedInComponent >> renderFooter: html [
	html footer
		class: 'footer page-footer font-italic';
		with: [ html div
				class: 'footer-copyright text-center py-3 text-white';
				with: [ html heading
						level: 4;
						class: 'text-white';
						with: '© 2018 Copyright: Company 2017-2018' ] ]
]

{ #category : #rendering }
SBLoggedInComponent >> renderHomePage: html [
	html div
    with: self pageContent.
]

{ #category : #rendering }
SBLoggedInComponent >> renderNavBar: html [
	html div with: self navBarComponent
]

{ #category : #rendering }
SBLoggedInComponent >> style [
	^ '.footer {
    position: fixed;
    bottom: 0;
    width: 100%;
    height: 55px;
    background-color: #D8D8D8;
}'
]
