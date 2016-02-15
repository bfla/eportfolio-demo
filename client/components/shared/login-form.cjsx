@LoginForm = React.createClass

  handleSubmit: (e) ->
    e.preventDefault()
    email = React.findDOMNode(@refs.email).value
    password = React.findDOMNode(@refs.password).value
    Meteor.loginWithPassword(email, password, @loginCallback)

  createNewAccount: ->
    user =
      email: React.findDOMNode(@refs.email).value
      password: React.findDOMNode(@refs.password).value
    Accounts.createUser(user, @loginCallback)

  loginCallback: (err) ->
    if err? and err.error is 403
      @setState(showCreateUser: true)
    return sAlert.error(err.message) if err?
    sAlert.warning('Welcome')
    FlowRouter.go('home')

  renderCreateNewUser: ->
    return <span></span> unless @state?.showCreateUser
    return (
      <span>
        <span>  </span>
        <button 
          type='button' 
          className='btn btn-success'
          onClick={@createNewAccount}
        >
            Create New Account
        </button>
      </span>
    )

  render: ->
    return (
      <div className='login-page'>
        <form ref='loginForm' className='form' onSubmit={@handleSubmit}>
          <fieldset className='form-group'>
            <input 
              ref='email' 
              type='email' 
              placeholder='you@youruniversity.edu'
              className='form-control'></input>
          </fieldset>
          <fieldset className='form-group'>
            <input 
              ref='password' 
              type='password' 
              className='form-control'
              placeholder='password'></input>
          </fieldset>
          <fieldset>
            <button type='submit' className='btn btn-primary-outline'> Sign in</button>
            {@renderCreateNewUser()}
          </fieldset>
        </form>
      </div>
    )
  