Template.highlightedSelector.helpers
	highlightedOnly: ->
		if Meteor.user().clase?.highlightedOnly
			return 'icon-toggle-on favorite-room'
		return 'icon-toggle-off'

Template.highlightedSelector.events
	'click .toggle-highlighted-only': (event) ->
		event.stopPropagation()
		event.preventDefault()
		Meteor.call 'claseHighlightedOnlyToggle'

	'click #clase_all_button': (event) ->
		event.stopPropagation()
		event.preventDefault()
		if Meteor.user().clase?.highlightedOnly
			Meteor.call 'claseHighlightedOnlyToggle'

	'click #clase_highlighted_only_button': (event) ->
		event.stopPropagation()
		event.preventDefault()
		if not Meteor.user().clase?.highlightedOnly
			Meteor.call 'claseHighlightedOnlyToggle'
