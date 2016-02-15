@ProjectPage = React.createClass
  mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    projectId: React.PropTypes.string.isRequired

  getMeteorData: ->
    subs = [Meteor.subscribe('projects')]
    data =
      subscriptions: subs
      project: Projects.findOne(@props.projectId)
    return data 

  render: ->
    return (
      <div className='project-page'>
        <Heading title={@data.project.title} />
        <div className='project-page-content col-md-8 col-md-offset-2 col-sm-12'>
          <p className='lead text-md-center'>
            {@data.project.descriptionHtml}
          </p>
        </div>
      </div>
    )
  