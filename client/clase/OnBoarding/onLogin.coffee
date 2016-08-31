Tracker.autorun (c) ->
	if Meteor.userId()
		Meteor.defer ->
			if Meteor.user().clase?.defaultRoom?
				room = Meteor.user().clase.defaultRoom
				FlowRouter.goToRoomById room
			else
				FlowRouter.go 'claseHome'
