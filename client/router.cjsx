# target = document.getElementById('react-target')

# Home page
FlowRouter.route('/',
  name: 'home'
  action: (params) ->
    ReactLayout.render(
      MainLayout, 
      content: <UserPortfolio />
    )
)

# Create new project
FlowRouter.route('/projects/create',
  # triggersEnter: [requiredLogin]
  name: 'createProject'
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <CreateProject />
    )
)

# View project
FlowRouter.route("/projects/:_id",
  name: 'viewProject'
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <ProjectPage projectId={params._id} />
    )
)

# Edit existing project
# FlowRouter.route("/projects/edit/:id",
#   action: (params) ->
#     ReactLayout.render(
#       MainLayout,
#       content: <EditProject projectId={params._id} />
#     )
# )

# Explore all projects
FlowRouter.route('/explore',
  name: 'exploreProjects'
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <ExploreProjects />
    )
)
