import React from 'react'
import PropTypes from 'prop-types'

const FormField = ({ label, name, onChange }) => {
  return (
    <div>
      <label>
        {label}
        <input type="text" name={name} onChange={onChange} />
      </label>
    </div>
  )
}

FormField.propTypes = {
  label: PropTypes.string,
  name: PropTypes.string,
  onChange: PropTypes.function
}

export default FormField