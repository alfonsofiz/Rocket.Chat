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

function sendButtonClickedEvent(button) {
	if (window.ga) {
		window.ga('send', 'event', button, 'Clicked', 'clicked on' + button + ' button');
	}
}

function sendChangeStateHighlightedOnly(state) {
	if (window.ga) {
		if (state) {
			window.ga('send', 'event', 'highlightedOnlyMode', 'Changed to Only', 'Highlighted Only Mode changed to Only');
		} else {
			window.ga('send', 'event', 'highlightedOnlyMode', 'Changed to All', 'Highlighted Only Mode changed to All');
		}
	}
}

RocketChat.callbacks.add('ClaseToggleHighlightedOnlyClicked', function(prevState) {
	sendButtonClickedEvent('ClaseToggleHighlightedOnly');
	sendChangeStateHighlightedOnly(prevState ? false : true);
});

RocketChat.callbacks.add('ClaseAllMessagesClicked', function(prevState) {
	sendButtonClickedEvent('ClaseAllMessages');
	if (prevState) {
		sendChangeStateHighlightedOnly(false);
	}

});

RocketChat.callbacks.add('ClaseHighlightedOnlyClicked', function(prevState) {
	sendButtonClickedEvent('ClaseHighlightedOnly');
	if (!prevState) {
		sendChangeStateHighlightedOnly(true);
	}
});
