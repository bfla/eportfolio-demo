@CreateProject = React.createClass
  # mixins: [ReactMeteorData, SpinnerMixin]

  # propTypes:
    # foo: React.PropTypes.object.isRequired

  # getMeteorData: ->
    # subs = [Meteor.subscribe('foo')]
    # data =
      # subscriptions: subs
      # foo: Foo.find()
    # return data 
  
  handleSubmit: (e) ->
    e.preventDefault()
    project =
      userId: Meteor.userId()
      title: React.findDOMNode(@refs.title).value
      descriptionHtml: React.findDOMNode(@refs.description).value
    Projects.insert(project, @handleRes)
    
  handleRes: (err) ->
    return sAlert.error(err.message) if err?
    FlowRouter.go('/')
    sAlert.success('Awesome! Your project was saved.')

  render: ->
    return (
      <div className='create-project container-fluid'>
        <form ref='form' onSubmit={@handleSubmit} className='col-md-6 col-md-offset-3 col-sm-12'>
          <h1 className='text-md-center'> Create a Project </h1>
          <fieldset class="form-group">
            <label for='workTitle'>Title</label>
            <input 
              id='workTitle' 
              ref='title'
              type='text' 
              placeholder='My awesome project' 
              className='form-control'
            ></input>
            <small>Be descriptive so that people understand what the project was</small>
          </fieldset>
          <fieldset className='form-group'>
            <label for='workDescription'>Description</label>
            <textarea 
              ref='description'
              className='form-control' 
              id='workDescription' 
              placeholder='The goal of this project was...'
              ></textarea>
            <small>Describe what the project was and what you did. </small>
          </fieldset>
          <fieldset className='form-group'>
            <a href='#' className='btn btn-success-outline'> 
              Add Attachments 
            </a>
          </fieldset>
          <button className='btn btn-primary' type='submit'>Submit</button>
        </form>
      </div>
    )
  