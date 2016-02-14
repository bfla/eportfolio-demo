target = document.getElementById('react-target')

FlowRouter.route('/',
  action: (params) ->
    ReactLayout.render(
      MainLayout, 
      content: <UserPortfolio />
    )
)

# FlowRouter.route('/:username',
  # action: (params) ->
# )
