@SkillsPage = React.createClass
  mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    skillId: React.PropTypes.string

  getMeteorData: ->
    subs = [Meteor.subscribe('skills'), Meteor.subscribe('activities')]
    if @props?.skillId
      subs.concat(Meteor.subscribe('workSkills'))
      subs.concat(Meteor.subscribe('projects'))
      data =
        subscriptions: subs
        user: Meteor.user()
        skill: Skills.findOne(_id: @props.skillId)
        skills: Skills.find().fetch()
        activities: Activities.find(skillId: @props.skillId).fetch()
        workSkills: WorkSkills.find(userId: Meteor.userId()).fetch()
        projects: Projects.find(userId: Meteor.userId()).fetch()
      return data
    else
      data =
        subscriptions: subs
        user: Meteor.user()
        skills: Skills.find().fetch()
        activities: Activities.find(skillId: @props.skillId).fetch()
      return data 

  title: ->
    if @props.skillId
      title = @data.skill.name
    else
      title = 'Choose a skill'

  skillLinks: ->
    @data.skills.map (skill) => <a href="/skills/#{skill._id}">{skill.name}</a>

  renderActivities: ->
    return <span></span> unless @props?.skillId?
    @data.activities.map (activity) =>
      ws = _.findWhere(@data.workSkills, activityId: activity._id)
      if ws?.projectId
        project = _.findWhere(@data.projects, _id: ws.projectId)
        return (
          <div className='col-lg-3 col-md-4 col-sm-6 col-xs-12'>
            <ActivityCard activity={activity} project={project} workSkill={ws} />
          </div>
        )
      else
        return (
          <div className='col-lg-3 col-md-4 col-sm-6 col-xs-12'>
            <ActivityCard activity={activity} />
          </div>
        )

  render: ->
    return (
      <div className=''>
        <Heading title={@title()} extraContent={@skillLinks()}/>
        {@renderActivities()}
      </div>
    )
  