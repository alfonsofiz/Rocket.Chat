Template.OnBoarding4.onRendered(function() {
	$('#initial-page-loading').remove();
});

Template.OnBoarding4.events({
	'click #clase_next': function() {
		FlowRouter.go('OnBoardingPiloto');
	}
});
