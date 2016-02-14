@Projects = new Mongo.Collection('projects')

_schema = new SimpleSchema
  title:
    type: String
  descriptionHtml:
    type: String
  visibTo:
    type: Object # visibTo.all
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    autoValue: -> new Date()
Projects.attachSchema(_schema)

Projects.allow
  insert: (userId, doc) -> return false
  update: (userId, doc, fieldNames, mod) -> return false
  remove: (userId, doc) -> return false

# Projects.deny
  # insert: (userId, doc) -> return true
  # update: (userId, doc) -> return true
  # remove: (userId, doc) -> return true
