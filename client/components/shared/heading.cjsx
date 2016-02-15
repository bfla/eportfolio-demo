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
        <div className='container-fluid text-md-center'>
          <h1 className='heading-title col-md-12'>
            {@props.title}
            <br/>
          </h1>
          <p className='lead heading-subtitle text-center'>
            {if @props.subtitle? then @props.subtitle else ''}
          </p>
        </div>        
      </div>
    )
  