Class {
	#name : #SBConferencePage,
	#superclass : #WAComponent,
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #rendering }
SBConferencePage >> renderContentOn: html [ 
	self renderImage: html.
	self renderDescription: html
]

{ #category : #rendering }
SBConferencePage >> renderDescription: html [
	html tbsContainer: [ 
		html break .	
		html paragraph: 'Since 1993, the International Smalltalk Conference is organised by ESUG every year, with tutorials, workshops and demonstrations on various subjects. Inactive links below on past summerschools will gradually be activated.'.
		html heading level:2; with: 'Hosting the Conference'.
		html paragraph: 'If you would like to organise the ESUG event please send all requiredinformation to esug-info@esug.org' ]

]

{ #category : #rendering }
SBConferencePage >> renderImage: html [
	html
		tbsContainer: [ html heading: 'Conferences'.
			html div
				with: [ html tbsImage
						class: 'center-block';
						class: 'img-responsive';
						url: 'http://esug.org/design/Conferences.jpg' ] ]
]
