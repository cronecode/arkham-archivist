import React, {Component} from 'react'

class Navbar extends Component {
  render() {
    return (
      <div className="container">
        <nav className="navbar navbar-default">
          <div className="container-fluid">
            <a href="/" className="navbar-brand">
              Arkham Archivist
            </a>
          </div>
        </nav>
      </div>
    )
  }
}

export default Navbar