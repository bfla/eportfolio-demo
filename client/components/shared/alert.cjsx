# https://atmospherejs.com/juliancwirko/s-alert
Meteor.startup ->
  sAlert.config(
    effect: 'genie'
    timeout: 2000
  )

@Alert = React.createClass
  componentDidMount: ->
    # Use Meteor Blaze to render login buttons
    @view = Blaze.render(
      Template.sAlert,
      React.findDOMNode(@refs.container)
    )
  
  componentWillUnmount: ->
    # Clean up Blaze view
    Blaze.remove(@view)
  
  render: ->
    # Just render a placeholder container that will be filled in
    return <span ref="container" />
  