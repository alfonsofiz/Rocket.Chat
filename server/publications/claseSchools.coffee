Meteor.publish 'claseSchools', ->
  unless this.userId
    return this.ready()

  Clase.Schools.find()
