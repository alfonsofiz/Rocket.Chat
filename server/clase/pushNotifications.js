/* global Push */

Push.addListener('error', function(err) {
	console.log('Push error');
	console.log(err);
});

var notifyMessage = function(message, room) {
	// skips this callback if the message was edited
	if (message.editedAt && !message.pinned) {
		return message;
	}

	var user = RocketChat.models.Users.findOneById(message.u._id);

	var highlightedOnly = message.pinned ? true : {$ne: true};

	var receivers = [];
	RocketChat.models.Users.find({
		username: {
			$in: room.usernames
		},
		_id: {
			$ne: user._id
		},
		'clase.highlightedOnly': highlightedOnly
	}, {
		fields: {
			_id: 1,
			username: 1,
			status: 1,
			statusConnection: 1
		}
	}).forEach(function(user) {
		receivers.push(user._id);
	});

	if (Push.enabled === true) {
		Push.send({
			from: 'push',
			title: '',
			text: message.msg,
			apn: {
				text: message.msg
			},
			badge: 1,
			sound: 'chime',
			payload: {
				host: Meteor.absoluteUrl(),
				rid: message.rid,
				sender: message.u,
				type: room.t,
				name: room.name
			},
			query: {
				userId: {
					$in: receivers
				}
			}
		});
	}
};

RocketChat.callbacks.add('afterSaveMessage', notifyMessage, RocketChat.callbacks.priority.LOW);
RocketChat.callbacks.add('afterPinMessage', notifyMessage, RocketChat.callbacks.priority.LOW);
