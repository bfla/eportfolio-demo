Meteor.publish 'projects', (projectId) ->
    Projects.find() #FIXIT - add privacy rules here

