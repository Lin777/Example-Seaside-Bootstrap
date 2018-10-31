Class {
	#name : #SBPromotionPage,
	#superclass : #WAComponent,
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #rendering }
SBPromotionPage >> renderArticlePromotion: html [

	html tbsColumn: [ 
		html heading level: 2; with: 'Article Promotion'.
		html paragraph: 'ESUG decided to offer 100 Euros for each paper that gets published on Smalltalk (Any Smalltalk, Squeak, Pharo, Tweak, Croquet, Seaside....). more...' ] mediumSize: 4.
]

{ #category : #rendering }
SBPromotionPage >> renderContentOn: html [ 	
	"http://esug.org/design/Promotion.jpg"
	self renderImage: html.
	self renderInformation: html.
]

{ #category : #rendering }
SBPromotionPage >> renderFreeBooks: html [
	html tbsColumn: [ 
		html heading level: 2; with: 'Free Books'.
		html paragraph: 'Current Program: Squeak by Example. ESUG supports Smalltalk by offering copies of Squeak by Example. more...' ] mediumSize: 4.
]

{ #category : #rendering }
SBPromotionPage >> renderGoogleGSOC: html [

	html tbsColumn: [ 
		html heading level: 2; with: 'Google GSOC'.
		html paragraph: 'ESUG is coordinating Google Summer of Code for the Smalltalk Community. For more, see http://gsoc2013.esug.org' ] mediumSize: 4.
]

{ #category : #rendering }
SBPromotionPage >> renderImage: html [
	html
		tbsContainer: [ html heading: 'Promotion'.
			html div
				with: [ html tbsImage
						class: 'center-block';
						class: 'img-responsive';
						url: 'http://esug.org/design/Promotion.jpg' ] ]
]

{ #category : #rendering }
SBPromotionPage >> renderInformation: html [
	html tbsContainer: [
		html tbsRow: [ 
			self renderMobilitySupport: html.
			self renderSummerTalk: html.
			self renderSupportYourProject: html. ].
		html tbsRow: [ 
			self renderFreeBooks: html.
			self renderArticlePromotion: html.
			self renderPublicationPromotion: html].
		html tbsRow: [ 
			self renderPromotionAward: html.
			self renderPastActions: html.
			self renderGoogleGSOC: html ]
		]
]

{ #category : #rendering }
SBPromotionPage >> renderMobilitySupport: html [
	html tbsColumn: [ html heading level: 2; with: 'Mobility Support'.
		html paragraph: 'ESUG wants to support the mobility of students that want to be in contact with research labs doing Smalltalk. We propose 5 grants of 600 Euros per year to students that want to do internships in labs doing smalltalk. more...' ]mediumSize: 4.
]

{ #category : #rendering }
SBPromotionPage >> renderPastActions: html [

	html tbsColumn: [ 
		html heading level: 2; with: 'Past Actions'.
		html paragraph: 'The following sums up the main actions ESUG performed in the past. more...' ] mediumSize: 4.
]

{ #category : #rendering }
SBPromotionPage >> renderPromotionAward: html [
	
	html tbsColumn: [ 
		html heading level: 2; with: 'Promotion Award'.
		html paragraph: 'ESUG is giving awards to the people who promote Smalltalk. more...' ] mediumSize: 4.
]

{ #category : #rendering }
SBPromotionPage >> renderPublicationPromotion: html [

	html tbsColumn: [ 
		html heading level: 2; with: 'Publication Promotion'.
		html paragraph: 'ESUG decided to offer 150 Euros for each research paper that gets published on Smalltalk (Squeak, Dialects, Tweak, Croquet, Seaside....). more...' ] mediumSize: 4.
]

{ #category : #rendering }
SBPromotionPage >> renderSummerTalk: html [
	html tbsColumn: [ html heading level: 2; with: 'SummerTalk'.
		html  paragraph: 'The SummerTalk program is here to help students work on open-source Smalltalk projects. The European Smalltalk User Group (http://www.esug.org/) will fund some students during the summer. more...' ] mediumSize: 4.
]

{ #category : #rendering }
SBPromotionPage >> renderSupportYourProject: html [
	html tbsColumn: [ 
		html heading level: 2; with: 'Support your project
'.
		html paragraph: 'ESUG wants to support your projects. It can be projects related to software development, teaching, conference presence, etc. more...' ] mediumSize: 4.
]
