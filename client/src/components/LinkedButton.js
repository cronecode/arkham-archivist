import React from 'react'
import { Link } from 'react-router-dom'

const LinkedButton = ({ path, label, icon }) => {
  const iconAliases = {
    action: 'fa fa-share fa-lg pull-left',
    bolt: 'fa fa-bolt fa-lg pull-left',
    close: 'fa fa-times fa-lg pull-left',
    eye: 'fa fa-eye fa-lg pull-left',
    plus: 'fa fa-plus fa-lg pull-left',
    trash: 'fa fa-trash-o fa-lg pull-left'
  }

  const iconCode = iconAliases[icon]

  return (
    <div>
      <Link to={path} className="btn btn-default btn-lg">
        <i className={iconCode} aria-hidden="true"></i>
        {label}
      </Link>
    </div>
  )
}

export default LinkedButton