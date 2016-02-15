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

  renderImg: ->
    return <span></span> unless @props.project.img?.m?
    return (
      <img 
        className='card-img-top' 
        alt="#{@props.project.title} image"
        src={@props.img.m}
      />
    )

  render: ->
    return (
      <div className='card project-card'>
        {@renderImg()}
        <div className='card-block'>
          <h5 className='card-title'>{@props.project.title}</h5>
          <p className='card-text'>{@props.project.descriptionHtml}</p>
        </div>
        <div className='card-block'>
          <a href='#' className='card-link btn btn-primary-outline btn-sm'>Edit</a>
          <a href='#' className='card-link btn btn-primary-outline btn-sm'>View</a>
        </div>
      </div>
    )
  