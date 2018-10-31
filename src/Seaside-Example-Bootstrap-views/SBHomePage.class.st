Class {
	#name : #SBHomePage,
	#superclass : #WAComponent,
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #rendering }
SBHomePage >> render2Denker: html [

	html tbsColumn: [ 
			html anchor url:'http://2denker.de/'; with: [ html tbsImage class: 'center-block'; width: '250'; url: 'http://esug.org/design/sponsor-2denker.png'. ] ]mediumSize: 4.
]

{ #category : #rendering }
SBHomePage >> renderChamaleonjohn: html [

	html tbsColumn: [ 
			html anchor url:'http://www.chameleonjohn.com/'; with: [ html tbsImage class: 'center-block'; height: '55'; url: 'http://esug.org/design/sponsor-chameleon.png'. ] ]mediumSize: 4.
]

{ #category : #rendering }
SBHomePage >> renderCollogia: html [

	html tbsColumn: [ 
			html anchor url:'http://www.collogia.de'; with: [ html tbsImage class: 'center-block'; width: '250'; url: 'http://esug.org/design/sponsor-collogia.jpg'. ] ]mediumSize: 3.
]

{ #category : #rendering }
SBHomePage >> renderContentOn: html [
	self renderDescription: html.
	html horizontalRule .
	self renderNews: html	.
	html horizontalRule .
	self renderSponsors: html
]

{ #category : #rendering }
SBHomePage >> renderDescription: html [
	|user|
	user := self session user firstName asString .
	html tbsJumbotron: [ 
		html tbsContainer: [ 
			html heading level: 2;
			with: 'Welcome ', user, ' to ESUG'.
		html paragraph: 'The ESUG board is pleased to announce that the 26th ESUG conference/summer-school will be held in Cagliari, Italy 10-14 September 2018; with Camp Smalltalk 8-9 September 2018. The conference is co-organised by University of Cagliari and the Agile Group of the Faculty of computer science. More information at https://esug.github.io/2018-Conference/conf2018.html.'.
		]].
html tbsContainer: [  
	
 html div with: [html tbsImage class: 'center-block'; url:'http://www.enqa.net/images/stories/events/esug_logo.jpg'.].
html paragraph: 'The European Smalltalk User Group (ESUG) is a non-profit users organization that supports all kinds of Smalltalk initiatives, especially free-open source ones that benefit the whole Smalltalk community. For example ESUG does:'.
		html unorderedList with: [
        html listItem: 'Link all users of the Smalltalk programming language and environments in Europe, individual and corporate'.
html listItem: 'Promote the use of Smalltalk'.
html listItem: 'Support local users groups and establish new ones'.
html listItem: 'Support Smalltalk projects and initiatives such as the Free Seaside Hosting Server' ]]
]

{ #category : #rendering }
SBHomePage >> renderFeenk: html [
	html tbsColumn: [ 
		html anchor url: 'http://feenk.com'; with: [ html tbsImage class: 'center-block'; height: '80'; url:'http://esug.org/design/sponsor-feenk.png' ] ]mediumSize: 4.
]

{ #category : #rendering }
SBHomePage >> renderGemTalk: html. [
		html tbsColumn: [ 
			html anchor url:'http://gemtalksystems.com'; with: [ html tbsImage class: 'center-block'; width: '250'; url: 'http://esug.org/design/sponsor-gemtalk.png'. ] ]mediumSize: 4.

]

{ #category : #rendering }
SBHomePage >> renderHeeg: html [
	html tbsColumn: [ 
			html anchor url:'http://www.heeg.de/'; with: [ html tbsImage class: 'center-block'; height: '100'; url: 'http://esug.org/design/sponsor-heeg.gif'. ] ]mediumSize: 4.

]

{ #category : #rendering }
SBHomePage >> renderHrworks: html [
	html tbsColumn: [ 
			html anchor url:'http://www.hrworks.de'; with: [ html tbsImage class: 'center-block'; height: '70'; url: 'http://esug.org/design/sponsor-hrworks.png'. ] ]mediumSize: 4.
]

{ #category : #rendering }
SBHomePage >> renderInria: html [
	html tbsColumn: [ 
			html anchor url:'http://inria.fr/'; with: [ html tbsImage class: 'center-block'; width: '250'; url: 'http://esug.org/design/sponsor-inria.png'. ] ]mediumSize: 4.

]

{ #category : #rendering }
SBHomePage >> renderInstantiations: html [
	html tbsColumn: [ 
		html anchor url: 'http://www.instantiations.com'; with: [ html tbsImage class: 'center-block'; width: '250'; url:'http://esug.org/design/sponsor-instantiations.jpg' ] ]mediumSize: 4.
]

{ #category : #rendering }
SBHomePage >> renderMediaGenix: html [

	html tbsColumn: [ 
			html anchor url:'http://www.mediagenix.tv'; with: [ html tbsImage class: 'center-block'; width: '250'; url: 'http://esug.org/design/sponsor-mediagenix.png'. ] ]mediumSize: 3.
]

{ #category : #rendering }
SBHomePage >> renderModal: html toNew: aNew [ 
	| modalId |
	modalId := 'modal_',aNew id asString .
	html html: '<a data-toggle="modal" href="#',modalId ,'" class="btn btn-primary btn-large">See more</a>'.			
	
	html tbsModal id: modalId ; with: [  
		html tbsModalDialog: [
			html tbsModalContent: [ 
				html tbsModalHeader: [ 
					html tbsModalCloseIcon.
					html tbsModalTitle level: 4; with: aNew title asString .				
				 ].
				html tbsModalBody: [ html paragraph: aNew description asString ]	.
				"html tbsModalFooter: [ 
					html tbsButton callback:[self answer: nil]; with: 'Close'.
				 ]"
			]
		]	
	].
	
	
	
]

{ #category : #rendering }
SBHomePage >> renderNews: html [
	| newsSize news i |
	i := 1.
	news := self session database retrieveNews.
	newsSize := news size.
	html div
		with: [ html
				tbsContainer: [ 
					html heading level:3; with: 'News'.
					[ i <= newsSize ]
						whileTrue: [ html
								tbsRow: [ 3
										timesRepeat: [ html
												tbsColumn: [ 
													self renderNews: news at: i in: html. 
													i := i + 1 ]
												mediumSize: 4 ] ] ] ] ]
]

{ #category : #rendering }
SBHomePage >> renderNews: news at: i in: html [
	| each |
	i <= news size
		ifTrue: [ each := news at: i.
			html
				tbsThumbnail: [ html heading
						level: 4;
						with: each title.
					html
						space;
						text: each description.
					html break .
					self renderModal: html toNew: each  ] ]
]

{ #category : #rendering }
SBHomePage >> renderObjekfabrik: html [

	html tbsColumn: [ 
			html anchor url:'http://http://objektfabrik.de'; with: [ html tbsImage class: 'center-block'; width: '250'; url: 'http://esug.org/design/sponsor-objektfabrik.jpg'. ] ]mediumSize: 3.
]

{ #category : #rendering }
SBHomePage >> renderOhra: html [
	html tbsColumn: [ 
		html anchor url: 'http://www.ohra.nl'; with: [ html tbsImage class: 'center-block'; width: '250'; url:'http://esug.org/design/sponsor-ohra.png' ] ]mediumSize: 4.
]

{ #category : #rendering }
SBHomePage >> renderPalantirsolutions: html [

	html tbsColumn: [ 
			html anchor url:'https://www.palantirsolutions.com'; with: [ html tbsImage class: 'center-block'; width: '250'; url: 'http://esug.org/design/sponsor-palantir.png'. ] ]mediumSize: 3.
]

{ #category : #rendering }
SBHomePage >> renderSponsors: html [
	html
		tbsContainer: [ html heading
				level: 2;
				with: 'Platinum Sponsors'.
			html
				tbsRow: [ self renderGemTalk: html.
					self renderFeenk: html.
					self renderInstantiations: html.
					html
						tbsColumn: [ html anchor
								url: '';
								with: [ html tbsImage
										width: '250';
										url: '' ] ]
						mediumSize: 4 ].
			html heading
				level: 2;
				with: 'Golden Sponsors'.
			html
				tbsRow: [ self renderInria: html.
					self renderHeeg: html.
					self renderOhra: html ].
			html heading
				level: 2;
				with: 'Silver Sponsors'.
			html
				tbsRow: [ self renderHrworks: html.
					self renderChamaleonjohn: html.
					self render2Denker: html ].
			html break.
			html
				tbsRow: [ self renderMediaGenix: html.
					self renderCollogia: html.
					self renderPalantirsolutions: html.
					self renderObjekfabrik: html ].
			html break .
			html break.
			html break .
			html break. ]
]
