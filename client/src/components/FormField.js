import React from 'react'
import PropTypes from 'prop-types'

const FormField = ({ label }) => {
  return (
    <div>
      <label>
        {label}
        <input type="text" />
      </label>
    </div>
  )
}

FormField.propTypes = {
  label: PropTypes.string
}

export default FormField