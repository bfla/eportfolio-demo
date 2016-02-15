@ProjectForm = React.createClass
  mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    projectId: React.PropTypes.string

  getMeteorData: ->
    subs = [Meteor.subscribe('projects')]
    data =
      subscriptions: subs
    data.project = Projects.findOne(@props.projectId) if @props.projectId
    return data 

  render: ->
    <div></div>

  renderForm: (project) ->

  