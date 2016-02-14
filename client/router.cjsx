target = document.getElementById('react-target')

FlowRouter.route('/',
  action: (params) ->
    ReactLayout.render(
      MainLayout, 
      content: <UserPortfolio />
    )
)

FlowRouter.route('/projects/create',
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <CreateProject />
    )
)

FlowRouter.route('/projects/edit/:id',
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <EditProject projectId={params._id} />
    )
)

# FlowRouter.route('/:username',
  # action: (params) ->
# )
