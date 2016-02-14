@MainLayout = React.createClass
  # mixins: [ReactMeteorData, SpinnerMixin]

  propTypes:
    content: React.PropTypes.element.isRequired

  # getMeteorData: ->
    # subs = [Meteor.subscribe('foo')]
    # data =
      # subscriptions: subs
      # foo: Foo.find()
    # return data 

  render: ->
    return (
      <div className='main-layout'>
        <Navbar />
        <main className='main-layout-content'>
          {@props.content}
        </main>
      </div>
    )
  