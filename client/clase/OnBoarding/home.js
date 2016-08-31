Template.home.helpers({
	title: function() {
		return RocketChat.settings.get('Layout_Home_Title');
	}
});

Template.claseHome.onRendered(function() {
	$('#initial-page-loading').remove();
});

Template.claseHome.events({
	'click #clase_add': function() {
		SideNav.setFlex('joinSchoolClassRoom');
		SideNav.openFlex();
		menu.toggle();
	}
});
