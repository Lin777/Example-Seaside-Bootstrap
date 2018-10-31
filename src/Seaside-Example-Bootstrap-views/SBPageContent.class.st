Class {
	#name : #SBPageContent,
	#superclass : #WAComponent,
	#instVars : [
		'content'
	],
	#category : #'Seaside-Example-Bootstrap-views'
}

{ #category : #rendering }
SBPageContent >> children [
	Array with: content 
]

{ #category : #accessing }
SBPageContent >> content [
	^ content
]

{ #category : #accessing }
SBPageContent >> content: anObject [
	content := anObject
]

{ #category : #rendering }
SBPageContent >> initialize [
	super initialize .
	self content: SBHomePage new.
]

{ #category : #rendering }
SBPageContent >> renderContentOn: html [ 
	html render: content
]
