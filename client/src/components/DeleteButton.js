import React from 'react'
import { Link } from 'react-router-dom'

const DeleteButton = (props) => {
  return (
    <Link to={'/campaigns/' + props.id } data-method="delete" className="btn btn-danger btn-md space-below">
      <span><i className="fa fa-trash-o fa-md"></i></span> Delete
    </Link>
  )
}

export default DeleteButton