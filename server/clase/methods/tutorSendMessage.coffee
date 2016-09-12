Meteor.methods
	claseTutorSendMessage: (school, level, line, secret, message) ->
		unless secret is 'pepapig'
			throw new Meteor.Error 'wrong-secret', 'Secreto malo', { method: 'claseTutorSendMessage' }

		room_name = school + '_2016' + '_' + level + '_' + line
		tutor = RocketChat.models.Users.findOneById('tutor')

		room = RocketChat.models.Rooms.findOneByName room_name
		unless room
			now = new Date()
			room = RocketChat.models.Rooms.createWithTypeNameUserAndUsernames 'c', room_name, tutor, [],
				ts: now

		tutor = RocketChat.models.Users.findOneById('tutor')

		RocketChat.models.Messages.createWithTypeRoomIdMessageAndUser 'tutor_message', room._id, message, tutor, {}
