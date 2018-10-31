Class {
	#name : #SBNews,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'description'
	],
	#category : #'Seaside-Example-Bootstrap-Models'
}

{ #category : #'instance creation' }
SBNews class >> newFromDataRow: aPGDataRow [

 ^ SBNews new
	id: (aPGDataRow  atName: #id);
  title: (aPGDataRow atName: #title);
  description: (aPGDataRow atName: #description);
  yourself
]

{ #category : #accessing }
SBNews >> description [
	^ description
]

{ #category : #accessing }
SBNews >> description: anObject [
	description := anObject
]

{ #category : #accessing }
SBNews >> id [
	^ id
]

{ #category : #accessing }
SBNews >> id: anObject [
	id := anObject
]

{ #category : #accessing }
SBNews >> title [
	^ title
]

{ #category : #accessing }
SBNews >> title: anObject [
	title := anObject
]
