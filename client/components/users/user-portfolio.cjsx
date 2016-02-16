@UserPortfolio = React.createClass
  mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    projects: React.PropTypes.array
    userId: React.PropTypes.string

  getMeteorData: ->
    userId = @props.userId || Meteor.userId()
    # subs = [Meteor.subscribe('projects')]
    data =
      # subscriptions: subs
      user: Meteor.user()
      projects: Projects.find(userId: userId).fetch()
    return data

  title: ->
    if @data.user?.profile?.firstName and @data.user?.profile?.lastName
      title = "#{@data.user.profile.firstName} #{@data.user.profile.lastName}"
    else
      title = "Jon Snow"

  renderGallery: ->
    if @data.projects?.length
      return (<ProjectGallery projects={@data.projects} />)
    else
      return (
        <div className='text-md-center'>
          <p className='lead'>You don't have any projects yet.</p>
          <a href='/projects/create' className='btn btn-success'> Create a Project </a>
        </div>
      )

  render: ->
    return (
      <div>
        <Heading title={@title()} />
        <div className='container-fluid user-portfolio-works'>
          {@renderGallery()}
        </div>
      </div>
    )
  