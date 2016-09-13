Template.OnBoarding3.onRendered(function() {
	$('#initial-page-loading').remove();
});

Template.OnBoarding3.events({
	'click #clase_next': function() {
		FlowRouter.go('OnBoarding4')
	}
});
