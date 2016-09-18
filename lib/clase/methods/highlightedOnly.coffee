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

		RocketChat.models.Users.update Meteor.userId(), update

		return Meteor.user().clase?.highlightedOnly
