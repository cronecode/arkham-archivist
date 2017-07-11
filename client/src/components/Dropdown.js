import React from 'react'
import PropTypes from 'prop-types'

const renderOptions = (options) => {
  return options.map((option) => <option key={option.key} value={option.value}>{option.value}</option>)
}

const Dropdown = ({ label, name, options, onChange }) => {
  return (
    <div>
      <label>
        <div className="col-xs-4">
          {label}
        </div>
        <div className="col-xs-8">
          <select type="select" name={name} onChange={onChange}>
            {renderOptions(options)}
          </select>
        </div>
      </label>
    </div>
  )
}

Dropdown.propTypes = {
  label: PropTypes.string,
  name: PropTypes.string,
  options: PropTypes.array,
  onChange: PropTypes.function
}

export default Dropdown