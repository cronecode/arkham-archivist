import React from 'react'

const Button = ({ onClick, label, icon }) => {
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
      <button onClick={onClick} className="btn btn-default btn-lg">
        <i className={iconCode} aria-hidden="true"></i>
        {label}
      </button>
    </div>
  )
}

export default Button