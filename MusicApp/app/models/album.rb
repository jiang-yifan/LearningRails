# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  category   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  band_id    :integer
#

class Album < ActiveRecord::Base
  CATEGORIES = ["Live", "Studio"]
  validates :category, inclusion: CATEGORIES
  validates :band, presence: true
  validates :name, presence: true, uniqueness: true

  has_many :tracks, inverse_of: :album, dependent: :destroy

  belongs_to :band, inverse_of: :albums
end
