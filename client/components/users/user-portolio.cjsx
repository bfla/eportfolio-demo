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

  render: ->
    return (
      <div>
        <Heading title="#{@data.user.firstName} #{@data.user.lastName}" />
        <div className='container-fluid user-portfolio-works'>
          <ProjectGallery projects={@data.projects} />
        </div>
      </div>
    )
  