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
    if @data.user?.profile? 
      title = "#{@data.user.firstName} #{@data.user.lastName}"
    else
      title = "?"

  render: ->
    return (
      <div>
        <Heading title={@title()} />
        <div className='container-fluid user-portfolio-works'>
          <ProjectGallery projects={@data.projects} />
        </div>
      </div>
    )
  