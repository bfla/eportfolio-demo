@Projects = new Mongo.Collection('projects')

_schema = new SimpleSchema
  userId:
    type: String
  title:
    type: String
  descriptionHtml:
    type: String
  # visibTo:
  #   type: Object # visibTo.all
  #   defaultValue: {all: true}
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    autoValue: -> new Date()
Projects.attachSchema(_schema)

Projects.allow
  insert: (userId, doc) -> return true if doc.userId is userId
  update: (userId, doc, fieldNames, mod) -> return true if doc.userId is userId
  remove: (userId, doc) -> return true if doc.userId is userId

# Projects.deny
  # insert: (userId, doc) ->
    # return true if _.pick(doc, '').length
  # update: (userId, doc) -> return true
  # remove: (userId, doc) -> return true
