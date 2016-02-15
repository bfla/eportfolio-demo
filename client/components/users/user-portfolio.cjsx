@UserPortfolio = React.createClass
  mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    projects: React.PropTypes.array

  getMeteorData: ->
    subs = [Meteor.subscribe('projects')]
    data =
      subscriptions: subs
      projects: Projects.find(userId: Meteor.userId()).fetch()
      user: Meteor.user()
    return data

  title: ->
    if @data.user?.profile?.firstName and @data.user?.profile?.lastName
      title = "#{@data.user.profile.firstName} #{@data.user.profile.lastName}"
    else
      title = "?"

  renderGallery: ->
    if @data.projects?.length
      return (<ProjectGallery projects={@data.projects} />)
    else
      return (
        <div>
          <p className='lead text-md-center'>You don't have any projects yet.</p>
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
  