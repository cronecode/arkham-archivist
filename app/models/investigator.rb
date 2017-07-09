class Investigator < ApplicationRecord
  belongs_to :campaign

  POSSIBLE_INVESTIGATORS = {
      ASHCAN_PETE:  'Ashcan Pete',
      AGNES_BAKER:  'Agnes Baker',
      DAISY_WALKER: 'Daisy Walker',
      JENNY_BARNES: 'Jenny Barnes',
      JIM_CULVER: 'Jim Culver',
      REX_MURPHY:   'Rex Murphy',
      ROLAND_BANKS: 'Roland Banks',
      SKIDS_OTOOLE: 'Skids O\'Toole',
      WENDY_ADAMS: 'Wendy Adams',
      ZOEY_SAMARAS: 'Zoey Samaras'
  }

  enum status: [:ACTIVE, :KILLED, :INSANE]

  ACTIVE = 'ACTIVE'
  KILLED = 'KILLED'
  INSANE = 'INSANE'

  validates :name, presence: true, uniqueness: true
  validates :physical_trauma, numericality: { greater_than_or_equal_to: 0 }
  validates :mental_trauma, numericality: { greater_than_or_equal_to: 0 }
  validates :experience_earned, numericality: { greater_than_or_equal_to: 0 }
  validates :unspent_experience, numericality: { greater_than_or_equal_to: 0 }
end
