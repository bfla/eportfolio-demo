@ExploreProjects = React.createClass
  mixins: [ReactMeteorData, SpinnerMixin]

  # propTypes:
    # foo: React.PropTypes.object.isRequired

  getMeteorData: ->
    subs = [Meteor.subscribe('projects')]
    data =
      subscriptions: subs
      projects: Projects.find().fetch()
    return data 

  render: ->
    return (
      <div className='explore-projects'>
        <Heading title='Explore Projects' subtitle='All projects on uPortfolio' />
        <ProjectGallery projects={@data.projects} />
      </div>
    )
  