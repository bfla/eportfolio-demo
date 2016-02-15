@MainLayout = React.createClass
  # mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    content: React.PropTypes.element.isRequired

  # getMeteorData: ->
    # subs = [Meteor.subscribe('foo')]
    # data =
      # subscriptions: subs
      # foo: Foo.find()
    # return data 

  render: ->
    if Meteor.user()?
      return (
        <div className='main-layout'>
          <Navbar />
          <main className='main-layout-content'>
            {@props.content}
          </main>
        </div>
      )
    else
      return (
        <div className='main-layout splash text-md-center'>
          <h1 className='title-splash'> uPortfolio </h1>
          <p className='lead subtitle-splash'> Share your projects with employers and other students </p>
          <a href='#' className='btn btn-primary-outline btn-splash'> Sign in </a>
        </div>
      )
  