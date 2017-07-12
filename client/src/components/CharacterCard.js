import React from 'react'

const CharacterCard = ({ name, physicalTrauma, mentalTrauma, experienceEarned, unspentXP }) => {
  return (
    <div className="thumbnail">
      <div className="row">
        <div className="col-xs-5">
          <img src={ require (`../images/${name}.png`) } alt={name} />
        </div>
        <div className="col-xs-7">
          <div className="row">
            <div className="col-xs-4">
              <div className="card-number">
                {physicalTrauma}
              </div>
            </div>
            <div className="col-xs-8 card-font">
              PHYSICAL TRAUMA
            </div>
          </div>
          <div className="row">
            <div className="col-xs-4">
              <div className="card-number">
                {mentalTrauma}
              </div>
            </div>
            <div className="col-xs-8 card-font">
              MENTAL TRAUMA
            </div>
          </div>
          <div className="row">
            <div className="col-xs-4">
              <div className="card-number">
                {experienceEarned}
              </div>
            </div>
            <div className="col-xs-8 card-font">
              XP EARNED
            </div>
          </div>
          <div className="row">
            <div className="col-xs-4">
              <div className="card-number">
                {unspentXP}
              </div>
            </div>
            <div className="col-xs-8 card-font">
              UNSPENT XP
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default CharacterCard