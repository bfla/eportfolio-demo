@ProjectGallery = React.createClass
  # mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    projects: React.PropTypes.array.isRequired

  renderProjects: ->
    @props.projects.map (project) => 
      return (
        <div className='col-md-4 col-lg-3 col-xs-12'>
          <ProjectCard key={project._id} project={project} />
        </div>
      )

  render: ->
    return (
      <div className='project-gallery'>
        {@renderProjects()}
      </div>
    )
  