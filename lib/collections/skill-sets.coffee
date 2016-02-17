@Skillsets = new Mongo.Collection('skillsets')

_schema = new SimpleSchema
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
Skillsets.attachSchema(_schema)

Skillsets.allow
  insert: (userId, doc) -> return true
  update: (userId, doc, fieldNames, mod) -> return true
  remove: (userId, doc) -> return true

# Skillsets.deny
  # insert: (userId, doc) -> return true
  # update: (userId, doc) -> return true
  # remove: (userId, doc) -> return true
