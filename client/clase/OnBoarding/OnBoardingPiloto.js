Template.OnBoardingPiloto.onRendered(function() {
	$('#initial-page-loading').remove();
});

Template.OnBoardingPiloto.events({
	'click #clase_next': function() {
		FlowRouter.go('OnBoarding5');
	}
});
