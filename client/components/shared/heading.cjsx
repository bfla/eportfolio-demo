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
        <h1 className='heading-title text-center'>
          {@props.title}
          <br/>
          <small className='heading-subtitle text-center'>
          </small>
          }
        </h1>
        
      </div>
    )
  