@ActivityCard = React.createClass
  # mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    activity: React.PropTypes.object.isRequired
    workSkill: React.PropTypes.object
    project: React.PropTypes.object

  # getMeteorData: ->
  #   subs = [Meteor.subscribe('foo')]
  #   data =
  #     subscriptions: subs
  #   return data 

  render: ->
    if @props?.workSkill
      <div className='card activities-card text-md-center'>
        <div className='card-block'>
          <p className='card-text text-muted'>{@props.activity.description}</p>
          <hr/>
          <h6 className='card-title'>{@props.project.title}</h6>
          <p className='card-text'>{@props.workSkill.description}</p>
          <a href="/projects/#{@props.project._id}" className='btn btn-primary-outline'> View </a>
        </div>
      </div>
    else
      <div className='card activities-card text-md-center'>
        <div className='card-block'>
          <p className='card-text'>{@props.activity.description}</p>
          <hr/>
          <a href='#' className='btn btn-success-outline'> Attach Project </a>
        </div>
      </div>
  