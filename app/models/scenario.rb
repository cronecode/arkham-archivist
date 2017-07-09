class Scenario < ApplicationRecord
  belongs_to :campaign

  SCENARIOS = {
      THE_GATHERING:            'The Gathering',
      MIDNIGHT_MASKS:           'Midnight Masks',
      DEVOURER_BELOW:           'The Devourer Below',
      EXTRACURRICULAR_ACTIVITY: 'Extracurricular Activity',
      THE_HOUSE_ALWAYS_WINS:    'The House Always Wins',
      MISKATONIC_MUSEUM:        'The Miskatonic Museum',
      ESSEX_COUNTY_EXPRESS:     'The Essex County Express',
      BLOOD_ON_THE_ALTAR:       'Blood on the Altar',
      UNDIMENSIONED_AND_UNSEEN: 'Undimensioned and Unseen',
      WHERE_DOOM_AWAITS:        'Where Doom Awaits',
      LOST_IN_TIME_AND_SPACE:   'Lost in Time and Space'
  }

  CYCLE_SCENARIOS_MAPPING = {
      Campaign::CYCLES[:NIGHT_OF_THE_ZEALOT] => [
          SCENARIOS[:THE_GATHERING],
          SCENARIOS[:MIDNIGHT_MASKS],
          SCENARIOS[:DEVOURER_BELOW]
      ],
      Campaign::CYCLES[:DUNWICH_LEGACY]      => [
          SCENARIOS[:EXTRACURRICULAR_ACTIVITY],
          SCENARIOS[:THE_HOUSE_ALWAYS_WINS],
          SCENARIOS[:MISKATONIC_MUSEUM],
          SCENARIOS[:ESSEX_COUNTY_EXPRESS],
          SCENARIOS[:BLOOD_ON_THE_ALTAR],
          SCENARIOS[:UNDIMENSIONED_AND_UNSEEN],
          SCENARIOS[:WHERE_DOOM_AWAITS],
          SCENARIOS[:LOST_IN_TIME_AND_SPACE]
      ]
  }

  enum resolution: [:no_resolution, :R1, :R2, :R3]

  validates :name, presence: true
  validates :campaign_id, presence: true
  validates :notes, length: {minimum: 1}, if: :notes_present?
  validates :victory_display, numericality: {only_integer: true, greater_than_or_equal_to: 0}, if: :victory_display_present?
  validates :order, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :order, uniqueness: {scope: :campaign_id}

  before_validation do
    self.notes = self.notes.strip if notes_present?
  end

  def notes_present?
    !notes.nil?
  end

  def victory_display_present?
    !victory_display.nil?
  end
end
