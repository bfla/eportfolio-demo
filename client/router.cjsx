target = document.getElementById('react-target')

# Home page
FlowRouter.route('/',
  action: (params) ->
    ReactLayout.render(
      MainLayout, 
      content: <UserPortfolio />
    )
)

# View project
FlowRouter.route("/projects/:_id",
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <ProjectPage projectId={params._id} />
    )
)

# Create new project
FlowRouter.route('/projects/create',
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <CreateProject />
    )
)

# Edit existing project
# FlowRouter.route('/projects/edit/:id',
#   action: (params) ->
#     ReactLayout.render(
#       MainLayout,
#       content: <EditProject projectId={params._id} />
#     )
# )

# Explore all projects
FlowRouter.route('/explore',
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <ExploreProjects />
    )
)
