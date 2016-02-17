@ProjectGallery = React.createClass
  # mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    projects: React.PropTypes.array.isRequired

  renderProjects: (projects) ->
    console.log('projects', projects)
    _.map projects, (project) ->
      <ProjectCard key={project._id} project={project} />

  # Render cascading grid (stacks vertically)
  divideProjectsIntoColumns: ->
    cols = [[], [], [], []] # 4 columns which will each contain projects
    # Divide projects into correct columns
    i = 0
    _.each @props.projects, (project) ->
      cols[i].push(project)
      i++
      i = 0 if i >= 4 # reset i to 0 after appending to the last column
    return cols

  renderCols: ->
    cols = @divideProjectsIntoColumns()
    console.log 'cols', cols
    # Render the columns
    _.map cols, (projectsInCol, i) => 
      return (
        <div key="col-#{i}" className='col-md-3 col-xs-12 col-sm-6'>
          {@renderProjects(projectsInCol)}
        </div>
      )

  render: ->
    return (
      <div className='project-gallery'>
        {@renderCols()}
      </div>
    )
  