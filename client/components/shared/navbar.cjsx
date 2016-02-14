@Navbar = React.createClass
  # mixins: [ReactMeteorData]

  # propTypes:
    # foo: React.PropTypes.object.isRequired

  # getMeteorData: ->
    # subs = [Meteor.subscribe('foo')]
    # data =
      # subscriptions: subs
      # foo: Foo.find()
    # return data 

  render: ->
    return (
      <header className='navbar navbar-light navbar-static-top custom-navbar' role='banner'>
        <AccountsUIWrapper />
      </header>
    )
  