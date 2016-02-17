@Activities = new Mongo.Collection('activities')

_schema = new SimpleSchema
  skillId:
    type: String
  name:
    type: String
  description:
    type: String
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    autoValue: -> new Date()
Activities.attachSchema(_schema)

Activities.allow
  insert: (userId, doc) -> return true
  update: (userId, doc, fieldNames, mod) -> return true
  remove: (userId, doc) -> return true

# Activities.deny
  # insert: (userId, doc) -> return true
  # update: (userId, doc) -> return true
  # remove: (userId, doc) -> return true
