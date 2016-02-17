@Skills = new Mongo.Collection('skills')

_schema = new SimpleSchema
  skillsetId:
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
Skills.attachSchema(_schema)

Skills.allow
  insert: (userId, doc) -> return true
  update: (userId, doc, fieldNames, mod) -> return true
  remove: (userId, doc) -> return true

# Skills.deny
  # insert: (userId, doc) -> return true
  # update: (userId, doc) -> return true
  # remove: (userId, doc) -> return true
