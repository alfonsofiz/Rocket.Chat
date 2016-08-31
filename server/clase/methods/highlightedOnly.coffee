Meteor.methods
	claseHighlightedOnlyToggle: () ->
		if Meteor.user().clase?.highlightedOnly
			update =
				$set:
					'clase.highlightedOnly': false
		else
			update =
				$set:
					'clase.highlightedOnly': true

		console.log update
		RocketChat.models.Users.update Meteor.userId(), update
		console.log Meteor.user().clase?.highlightedOnly

		return Meteor.user().clase?.highlightedOnly
