Class {
	#name : #SBSmalltalk,
	#superclass : #WAComponent,
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #rendering }
SBSmalltalk >> renderAboutSmalltalk: html [

html tbsColumn: [ 
		html heading level: 2; with: 'About Smalltalk'.
		html tbsImage width: '297' ;url: 'http://esug.org/design/WorldStLogo.png'.
		html paragraph: 'World.st provides a comprehensive overview of community related resources about Smalltalk.' ] mediumSize: 4.
]

{ #category : #rendering }
SBSmalltalk >> renderCompanies: html [

html tbsColumn: [ 
		html heading level: 2; with: 'Companies'.
		html paragraph: 'Here is a list of companies that use Smalltalk: Companies' ] mediumSize: 4.
]

{ #category : #rendering }
SBSmalltalk >> renderContentOn: html [ 
	self renderImage: html.
	self renderInformation: html
]

{ #category : #rendering }
SBSmalltalk >> renderImage: html [
	html
		tbsContainer: [ html heading: 'Smalltalk'.
			html div
				with: [ html tbsImage
						class: 'center-block';
						class: 'img-responsive';
						url: 'http://esug.org/design/Smalltalk.jpg' ] ]
]

{ #category : #rendering }
SBSmalltalk >> renderInformation: html [
	html tbsContainer: [
		html tbsRow: [ 
			self renderCompanies: html.
			self renderAboutSmalltalk: html.
			self renderVideos: html. ].
		html tbsRow: [ 
			self renderPress: html.
			self renderSmalltalkArchive: html.
			self renderUserGroups: html].]
]

{ #category : #rendering }
SBSmalltalk >> renderPress: html [
html tbsColumn: [ 
		html heading level: 2; with: 'Press'.
		html paragraph: 'Journal articles and news reports about Smalltalk. more...' ] mediumSize: 4.
]

{ #category : #rendering }
SBSmalltalk >> renderSmalltalkArchive: html [

html tbsColumn: [ 
		html heading level: 2; with: 'Smalltalk-Archive'.
		html paragraph: 'ESUG is Collecting Material related to Smalltalk:

http://esug.org/data/

(Here you can find the ESUG Logo in High res,too)' ] mediumSize: 4.
]

{ #category : #rendering }
SBSmalltalk >> renderUserGroups: html [ 

html tbsColumn: [ 
		html heading level: 2; with: 'User Groups'.
		html paragraph: 'Here is a list of local Smalltalk user groups: http://www.world.st/usergroups' ] mediumSize: 4.
]

{ #category : #rendering }
SBSmalltalk >> renderVideos: html [
html tbsColumn: [ 
		html heading level: 2; with: 'Videos'.
		html paragraph: 'ESUG has collected a number of videos and made them available via google video. more...' ] mediumSize: 4.
]
