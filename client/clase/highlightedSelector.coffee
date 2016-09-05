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
