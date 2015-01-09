# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  track_type :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer
#

class Track < ActiveRecord::Base
  TRACK_TYPES = ["regular", "bonus"]
  validates :track_type, presence: true, inclusion: TRACK_TYPES
  validates :name, :lyrics, presence: true
  validates :name, uniqueness: {scope: :album_id}, if: :skip_unique?
  validates :album, presence: true

  belongs_to :album, inverse_of: :tracks

  has_many :notes, inverse_of: :track, dependent: :destroy

  has_one :band, through: :album, source: :band

  def skip_unique?
    persisted?
  end
end
