Template.OnBoarding2.onRendered(function() {
	$('#initial-page-loading').remove();
});

Template.OnBoarding2.events({
	'click #clase_next': function() {
		FlowRouter.go('OnBoarding3')
	}
});
