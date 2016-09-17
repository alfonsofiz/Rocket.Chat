FlowRouter.triggers.enter([(route) => {
	if (window.ga) {
		window.ga('send', 'pageview', route);
	}
}]);

RocketChat.callbacks.add('afterSaveMessage', (message) => {
	if (window.ga) {
		let label = '';
		if (message) {
			let room = ChatRoom.findOne({ _id: message.rid });
			label = 'Message sent: '+ room.name + ' (' + room._id + ')';
		}
		window.ga('send', 'event', 'Message', 'Sent', label);
	}
}, 2000);
