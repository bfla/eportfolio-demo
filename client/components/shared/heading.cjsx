@Heading = React.createClass
  # mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    title: React.PropTypes.string
    subtitle: React.PropTypes.string
    image: React.PropTypes.object

  # getMeteorData: ->
    # subs = [Meteor.subscribe('foo')]
    # data =
      # subscriptions: subs
      # foo: Foo.find()
    # return data

  render: ->
    return (
      <div className='heading'>
        <div className='container-fluid'>
          <h1 className='heading-title text-md-center col-md-12'>
            {@props.title}
            <br/>
            <small className='heading-subtitle text-center'>
              {if @props.subtitle? then @props.subtitle else ''}
            </small>
          </h1>
        </div>        
      </div>
    )
  