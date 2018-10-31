Class {
	#name : #SBAboutUsPage,
	#superclass : #WAComponent,
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #rendering }
SBAboutUsPage >> renderContentOn: html [ 
	self renderImage: html.
	self renderInformation: html.
	self renderGoals: html.
]

{ #category : #rendering }
SBAboutUsPage >> renderGoals: html [
	html tbsContainer: [ 
		html heading level:2; with:'Our Goals'.
		html paragraph: 'ESUG is a non-profit association that gathers all European users of all dialects of Smalltalk. It was registered in 1991 under French status "Association de Loi 1901".

Its goals are to:'.
		html unorderedList with: [ html listItem: 'promote use of the Smalltalk programming language'.
			html listItem: 'promote communication between Smalltalk users through meetings, periodic newsletter, software exchange, electronic mail, etc., and by organizing events like the Smalltalk Yearly Conference'.
			html listItem: 'help and link local Smalltalk users groups'.
			html listItem: 'help the creation of local Smalltalk users groups'.
			html listItem: 'identify Smalltalk users and their needs and represent them towards discussions with vendors.
' ].
html paragraph: 'ESUG usually meets at Object-Oriented Conferences, such as Tools, Ecoop and OOPSLA, and the ESUG users conference. Board members can be reached through e-mail at esug-info@esug.org (which broadcasts to all board members) for information.

For mailings to members and everybody who subscribed directly to the mailing list you can send a mail to esug-list@lists.esug.org. To visit the mailing list go to http://lists.esug.org/mailman/listinfo/esug-list_lists.esug.org, currently more than 500 Smalltalkers all over Europe and beyond!.

Info on the ESUG board members is also available. If you want to become an ESUG member, you can check out the Membership page.' ]
]

{ #category : #rendering }
SBAboutUsPage >> renderImage: html [
	html
		tbsContainer: [ html heading: 'About us'.
			html div
				with: [ html tbsImage
						class: 'center-block';
						class: 'img-responsive';
						url: 'http://esug.org/design/Aboutus.jpg' ] ]
]

{ #category : #rendering }
SBAboutUsPage >> renderInformation: html [
	html tbsContainer: [ 
		html tbsRow: [ 
			html tbsColumn: [ 
				html heading level: 2; with: 'Contact ESUG'.
				html paragraph: 'You can reach the ESUG board at board@esug.org' ] mediumSize: 4.
			html tbsColumn: [ 
				html heading level: 2; with: 'Board'.
				html paragraph: 'The ESUG Board as elected 2010'.
				html paragraph: '- President: Stéphane Ducasse (Inria)
- Treasurer: Luc Fabresse (EMD)
- Damien Cassou (Univ. Lille 1)
- Jordi Delgado (Politecnica Catalunya)
- Marcus Denker (Inria)
- Alain Plantec (UBO)
- Serge Stinckwich (IRD)'] mediumSize: 4.
		html tbsColumn: [ 
			html heading level: 2; with: 'Legal Information'.
			html paragraph: 'ESUG is a french-law association, and hence it is not subject to the VAT. It does not have a siret number but is registered under the number W751167780.' ] mediumSize: 4.] ]
]
