Meteor.startup ->
	Meteor.defer ->
		if not RocketChat.models.Users.findOneById('tutor')?
			RocketChat.models.Users.create
				_id: 'tutor'
				name: "Tutor"
				username: 'tutor'
				status: "online"
				statusDefault: "online"
				utcOffset: 0
				active: true
				type: 'bot'

			RocketChat.authz.addUserRoles('tutor', 'bot')
