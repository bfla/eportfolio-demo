@UserPortfolio = React.createClass
  mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    projects: React.PropTypes.array

  getMeteorData: ->
    subs = [Meteor.subscribe('projects')]
    data =
      subscriptions: subs
      projects: Projects.find().fetch()
      user: Meteor.user().profile
    return data

  renderProjects: ->
    @data.projects.map (project) => 
      return (
        <div className='col-md-4 col-lg-3 col-xs-12'>
          <ProjectCard key={project._id} project={project} />
        </div>
      )

  render: ->
    return (
      <div>
        <Heading title="#{@data.user.firstName} #{@data.user.lastName}" />
        <div className='container-fluid user-portfolio-works'>
          {@renderProjects()}
        </div>
      </div>
    )
  