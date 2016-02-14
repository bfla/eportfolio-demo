FlowRouter.route('/',
  action: (params) ->
    target = document.getElementById('react-target')
    if Meteor.user()
      ReactDOM.render(<UserPortfolio />, target)
    else
      # ReactDOM.render(<Splash />, target)
)
