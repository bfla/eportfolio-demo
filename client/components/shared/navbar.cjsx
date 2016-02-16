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

  onGroupsClick: (e) ->
    e.preventDefault()
    sAlert.error('Groups are not implemented in this demo')

  render: ->
    return (
      <header className='navbar navbar-light navbar-static-top custom-navbar' role='banner'>
        <ul className='nav navbar-nav'>
          <li className='nav-item'>
            <a href='/' className='nav-link'> uPortfolio </a>
          </li>
          <li className='nav-item'>
            <a href='/explore' className='nav-link'> Explore Projects </a>
          </li>
          <li className='nav-item'>
            <a href='#' className='nav-link' onClick={@onGroupsClick}> Your Groups </a>
          </li>
        </ul>
        <ul className='nav navbar-nav pull-md-right'>
          <li className='nav-item'>
            <a href='projects/create' className='nav-link btn btn-sm btn-primary-outline'> Create Project </a>
          </li>
          <li className='nav-item'>
            <AccountsUIWrapper />
          </li>
        </ul>
      </header>
    )
  