Meteor.publish 'projects', ->
    Projects.find() #FIXIT - add privacy rules here

Meteor.publish 'skills', -> Skills.find()

Meteor.publish 'skillsets', -> Skillsets.find()

Meteor.publish 'activities', -> Activities.find()

Meteor.publish 'workSkills', -> WorkSkills.find(userId: @userId)
