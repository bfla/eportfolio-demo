@SkillsPage = React.createClass
#   mixins: [ReactMeteorData, SpinnerMixin]

#   propTypes:
#     skillId: React.PropTypes.string

#   getMeteorData: ->
#     subs = [Meteor.subscribe('skills'), Meteor.subscribe('activities'), Meteor.subscribe('workSkills')]
#     data =
#       subscriptions: subs
#       skills: Skills.find().fetch()
#       activities: Activities.find(skillId: @props.skillId).fetch()
#       workSkills: WorkSkills.find(userId: Meteor.userId())
#     return data 

  # title: ->
  #   if @props.skillId
  #     skill = _.where(@data.skills, _id: @props.skillId)
  #     title = skill.name
  #   else
  #     title = 'Choose a skill'

  # skillLinks: ->
  #   @data.skills.map (skill) => <a href="/skills/#{skill._id}">{skill.name}</a>

  render: ->
    return (
      <div className=''>
        <h1> Skills page </h1>
      </div>
    )
  