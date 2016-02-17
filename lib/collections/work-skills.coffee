@WorkSkills = new Mongo.Collection('workskills')

_schema = new SimpleSchema
  userId:
    type: String
  activityId:
    type: String
  projectId:
    type: String
  description:
    type: String
    optional: true
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    autoValue: -> new Date()
WorkSkills.attachSchema(_schema)

WorkSkills.allow
  insert: (userId, doc) -> return true if doc.userId is userId
  update: (userId, doc, fieldNames, mod) -> return true if doc.userId is userId
  remove: (userId, doc) -> return true if doc.userId is userId

# WorkSkills.deny
  # insert: (userId, doc) -> return true
  # update: (userId, doc) -> return true
  # remove: (userId, doc) -> return true
