Template.combined.helpers
	isActive: ->
		return 'active' if ChatSubscription.findOne({ t: { $in: ['c', 'p']}, f: { $ne: true }, open: true, rid: Session.get('openedRoom') }, { fields: { _id: 1 } })?

	rooms: ->
		query =
			t: { $in: ['c', 'p']},
			open: true

		if RocketChat.settings.get 'Favorite_Rooms'
			query.f = { $ne: true }

		if Meteor.user()?.settings?.preferences?.unreadRoomsMode
			query.alert =
				$ne: true

		return ChatSubscription.find query, { sort: 'name': 1 }

	canCreate: ->
		return RocketChat.authz.hasAtLeastOnePermission ['create-c', 'create-p']

	showAdminOption: ->
		return RocketChat.authz.hasAtLeastOnePermission( ['view-statistics', 'view-room-administration', 'view-user-administration', 'view-privileged-setting' ]) or RocketChat.AdminBox.getOptions().length > 0

	registeredMenus: ->
		return AccountBox.getItems()

Template.combined.events
	'click .add-room': (e, instance) ->
		if RocketChat.authz.hasAtLeastOnePermission(['create-c', 'create-p'])
			SideNav.setFlex "createCombinedFlex"
			SideNav.openFlex()
		else
			e.preventDefault()

	'click .more-channels': ->
		SideNav.setFlex "listCombinedFlex"
		SideNav.openFlex()

	'click .clase-add-child': ->
		SideNav.setFlex "joinSchoolClassRoom"
		SideNav.openFlex()





	'click #logout': (event) ->
				event.preventDefault()
				user = Meteor.user()
				Meteor.logout ->
					RocketChat.callbacks.run 'afterLogoutCleanUp', user
					Meteor.call('logoutCleanUp', user)
					FlowRouter.go 'home'


	'click #admin': ->
				SideNav.setFlex "adminFlex"
				SideNav.openFlex()
				FlowRouter.go 'admin-info'
