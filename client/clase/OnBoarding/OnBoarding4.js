Template.OnBoarding4.onRendered(function() {
	$('#initial-page-loading').remove();
});

Template.OnBoarding4.events({
	'click #clase_register': function() {
		Session.set("loginDefaultState","register");
		FlowRouter.go("home");

	},
	'click #clase_login': function() {
		Session.set("loginDefaultState","login");
		FlowRouter.go("home");
	}
})
