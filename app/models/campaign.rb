class Campaign < ApplicationRecord
  has_many :scenarios, dependent: :destroy
  has_many :investigators, dependent: :destroy

  CYCLES = {
      NIGHT_OF_THE_ZEALOT: 'Night of the Zealot',
      DUNWICH_LEGACY: 'The Dunwich Legacy'
  }

  validates :name, presence: true
  validates :cycle, inclusion: { in: CYCLES.values }
end
