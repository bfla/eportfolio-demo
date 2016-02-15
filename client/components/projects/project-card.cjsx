@ProjectCard = React.createClass
  # mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    project: React.PropTypes.object.isRequired

  # getMeteorData: ->
  #   subs = [Meteor.subscribe('projects')]
  #   data =
  #     subscriptions: subs
  #     project
  #   return data 
  editProject: (e) ->
    e.preventDefault()
    sAlert.error('Sorry, this demo does not support editing.')

  renderImg: ->
    if @props.project.img?.m?
      return (
        <img 
          className='card-img-top' 
          alt="#{@props.project.title} image"
          src={@props.project.img.m}
        />
      )
    else
      return (
        <div className='card-img-top img-project-card-missing'> 
          <p className='img-project-card-missing-caption'>No image</p>
        </div>)

  render: ->
    return (
      <div className='card project-card'>
        {@renderImg()}
        <div className='card-block'>
          <h6 className='card-title'>{@props.project.title}</h6>
          <p className='card-text'>
            {@props.project.descriptionHtml}
            <br/>
            <small className='text-muted'>updated {@props.project.updatedAt.toDateString()}</small>
          </p>
        </div>
        <hr/>
        <div className='card-block'>
          <a href='#' 
            className='card-link btn btn-primary-outline btn-sm'
            onClick={@editProject}
          >
              Edit
          </a>
          <a 
            href="/projects/#{@props.project._id}" 
            className='card-link btn btn-primary-outline btn-sm'>
              View
          </a>
        </div>
      </div>
    )
  