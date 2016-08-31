Template.highlightedSelector.helpers
	highlightedOnly: ->
		if Meteor.user().clase?.highlightedOnly
			return 'icon-star favorite-room'
		return 'icon-star-empty'

Template.highlightedSelector.events
	'click .toggle-highlighted-only': (event) ->
		event.stopPropagation()
		event.preventDefault()
		Meteor.call 'claseHighlightedOnlyToggle'
