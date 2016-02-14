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

  render: ->
    return (
      <div className='card project-card'>
        <img className='card-img-top' alt="#{project.title} image"/>
        <div className='card-block'>
          <h5 className="card-title">{project.title}</h5>
          <p className='card-text'>{project.descriptionHtml}</p>
        </div>
        <div className='card=block'>
          <a href='#' className='card-link'>Edit</a>
          <a href='#' className='card-link'>View</a>
        </div>
      </div>
    )
  