@LoginForm = React.createClass

  handleSubmit: (e) ->
    e.preventDefault()
    email = React.findDOMNode(@refs.email).value
    password = React.findDOMNode(@refs.password).value
    console.log 'handling submit', email, password
    Meteor.loginWithPassword(email, password, @loginCallback)

  loginCallback: (err) ->
    return sAlert.error(err.message) if err?
    sAlert.warning('Welcome')
    FlowRouter.go('/')

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
          </fieldset>
        </form>
      </div>
    )
  