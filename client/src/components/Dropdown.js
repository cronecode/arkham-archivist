import React from 'react'
import PropTypes from 'prop-types'

const Dropdown = ({ label, options }) => {
  return (
    <div>
      <label>
        <div className="col-xs-4">
          {label}
        </div>
        <div className="col-xs-8">
          <select type="select">
            {renderOptions(options)}
          </select>
        </div>
      </label>
    </div>
  )
}

Dropdown.propTypes = {
  label: PropTypes.string,
  options: PropTypes.array
}

const renderOptions = (options) => {
  return options.map((option) => <option value={option.value}>{option.label}</option>)
}

export default Dropdown