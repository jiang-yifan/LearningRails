# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  note       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  track_id   :integer
#

class Note < ActiveRecord::Base
  validates :note, :user_id, :track_id, presence: true

  belongs_to :user
  belongs_to :track
end
