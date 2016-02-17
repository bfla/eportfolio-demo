# target = document.getElementById('react-target')

# Home page
FlowRouter.route('/',
  name: 'home'
  action: (params) ->
    userId = params.userId || Meteor.userId()
    ReactLayout.render(
      MainLayout, 
      content: <UserPortfolio userId={userId}/>
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

# Skills page
FlowRouter.route('/skills',
  name: 'skills'
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <SkillsPage />
    )
)
# Skills page for particular skill
FlowRouter.route('/skills/:_id',
  name: 'skills'
  action: (params) ->
    ReactLayout.render(
      MainLayout,
      content: <SkillsPage skillId={params._id} />
    )
)
