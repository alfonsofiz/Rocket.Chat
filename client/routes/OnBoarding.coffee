FlowRouter.route '/OnBoarding1',
	name: 'OnBoarding1'
	action: ->
		BlazeLayout.render 'OnBoarding1'

FlowRouter.route '/OnBoarding2',
	name: 'OnBoarding2'
	action: ->
		BlazeLayout.render 'OnBoarding2'

FlowRouter.route '/OnBoarding3',
	name: 'OnBoarding3'
	action: ->
		BlazeLayout.render 'OnBoarding3'

FlowRouter.route '/OnBoarding4',
	name: 'OnBoarding4'
	action: ->
		BlazeLayout.render 'OnBoarding4'

FlowRouter.route '/claseHome',
	name: 'claseHome'
	action: ->
		RocketChat.TabBar.showGroup 'home'
		BlazeLayout.render 'main', {center: 'claseHome'}
		KonchatNotification.getDesktopPermission()
