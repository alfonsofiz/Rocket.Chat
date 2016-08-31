Template.OnBoarding1.onRendered(function() {
	$('#initial-page-loading').remove();
});

Template.OnBoarding1.events({
	'click #clase_next': function() {
		FlowRouter.go('OnBoarding2');
	}
});
