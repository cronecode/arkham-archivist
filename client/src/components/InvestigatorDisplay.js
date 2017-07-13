import React from 'react'
import CharacterCard from './CharacterCard'

const renderInvestigators = (investigators) => {
  return investigators.map((investigator) => {
    return <CharacterCard key={investigator.id}
                          name={investigator.name}
                          physicalTrauma={investigator.physicalTrauma}
                          mentalTrauma={investigator.mentalTrauma}
                          experienceEarned={investigator.experienceEarned}
                          unspentXP={investigator.unspentExperience}/>
  })
}

const InvestigatorDisplay = ({ investigators }) => {
  return (
    <div>
      {renderInvestigators(investigators)}
    </div>
  )
}

export default InvestigatorDisplay