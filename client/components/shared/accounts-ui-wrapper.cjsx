# Accounts.ui.config(passwordSignupFields: "USERNAME_ONLY")

@AccountsUIWrapper = React.createClass
  componentDidMount: ->
    # Use Meteor Blaze to render login buttons
    @view = Blaze.render(
      Template.loginButtons,
      React.findDOMNode(@refs.container)
    )
  
  componentWillUnmount: ->
    # Clean up Blaze view
    Blaze.remove(@view)
  
  render: ->
    # Just render a placeholder container that will be filled in
    return <span ref="container" />
