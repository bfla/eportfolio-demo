@Groups = new Mongo.Collection('groups')

_schema = new SimpleSchema
  name:
    type: String
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    autoValue: -> new Date()
Groups.attachSchema(_schema)

Groups.allow
  insert: (userId, doc) -> return false
  update: (userId, doc, fieldNames, mod) -> return false
  remove: (userId, doc) -> return false

Groups.deny
  insert: (userId, doc) -> return true unless Meteor.user().private?.isAdmin
  # update: (userId, doc) -> return true
  # remove: (userId, doc) -> return true
