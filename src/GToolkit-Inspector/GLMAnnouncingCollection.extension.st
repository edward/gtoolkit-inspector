Extension { #name : #GLMAnnouncingCollection }

{ #category : #'*GToolkit-Inspector' }
GLMAnnouncingCollection >> gtAddRandomItemAction: anAction [
	<gtAction>
	| action |
	action := anAction explicit.
	^ action stencil: [ :element |
		| button |
		button := BrButton new.
		button
		aptitude: BrGlamorousButtonWithIconAptitude; 
		action: [ 
			self add:'random'.
		];
		icon: BrGlamorousVectorIcons add;
		label: 'Add random element'.
	].
]

{ #category : #'*GToolkit-Inspector' }
GLMAnnouncingCollection >> gtItemsFor: aView [
    <gtView>
    ^ aView explicit
        title: 'Items';
        priority: 50;
        stencil: [ 
            | list refreshBlock |
            list := BrColumnedList new
                addEventHandler: GtPhlowListToSelectHandler new;
                display: self asOrderedCollection.
				refreshBlock := [  list aptitude request: BrListItemsRequest new].
				self when: GLMItemAdded do: refreshBlock.
				self when: GLMItemChanged do: refreshBlock.
				self when: GLMItemRemoved do: refreshBlock.
            list column
                title: 'Item';
                stencil: [ :each :anIndex | BrColumnCellLabelStencil new text: each gtDisplayString ].
            list ]
]

{ #category : #'*GToolkit-Inspector' }
GLMAnnouncingCollection >> gtRemoveRandomItemAction: anAction [
	<gtAction>
	| action |
	action := anAction explicit.
	^ action stencil: [ :element |
		| button |
		button := BrButton new.
		button
		aptitude: BrGlamorousButtonWithIconAptitude; 
		action: [ 
			self remove: 'random'.
		];
		icon: BrGlamorousVectorIcons remove;
		label: 'Remove random element'.
	].
]
