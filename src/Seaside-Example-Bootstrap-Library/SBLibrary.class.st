Class {
	#name : #SBLibrary,
	#superclass : #WAFileLibrary,
	#category : #'Seaside-Example-Bootstrap-Library'
}

{ #category : #'as yet unclassified' }
SBLibrary class >> applicationName [

 ^ 'ESUG registration'

]

{ #category : #updating }
SBLibrary >> updateRoot: anHtmlRoot [
 
 super updateRoot: anHtmlRoot.
 "anHtmlRoot stylesheet
  url: SBLibrary / #mainCss.
 anHtmlRoot javascript
  url: SBLibrary / #mainJs."
]
