@MainLayout = React.createClass

  mixins: [ReactMeteorData]

  propTypes:
    content: React.PropTypes.element.isRequired

  getMeteorData: ->
    data =
      # subscriptions: subs
      user: Meteor.user()
    return data

  getInitialState: -> 
    showSigninForm: false

  showSigninForm: -> @setState(showSigninForm: true)

  renderSignin: ->
    if @state.showSigninForm
      return (
        <div className='col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3'>
          <LoginForm />
        </div>
      )
    else
      return (
        <a 
          href='#' 
          className='btn btn-primary-outline btn-splash' 
          onClick={@showSigninForm}> 
            Sign in 
        </a>
      )

  render: ->
    if @data.user?
      return (
        <div className='main-layout'>
          <Alert />
          <Navbar />
          <main className='main-layout-content'>
            {@props.content}
          </main>
        </div>
      )
    else if Meteor.loggingIn()
      <div className='main-layout'>
        <Alert />
        <Navbar />
        <main className='main-layout-content'>
          <SpinnerView />
        </main>
      </div> 
    else
      return (
        <div className='main-layout splash text-md-center'>
          <Alert />
          <h1 className='title-splash'> uPortfolio </h1>
          <p className='lead subtitle-splash'> Share your projects with employers and other students </p>
          {@renderSignin()}
        </div>
      )
  