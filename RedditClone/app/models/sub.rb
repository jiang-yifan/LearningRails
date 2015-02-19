# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base

  validates :title, :moderator_id, presence: true

  belongs_to(
    :moderator,
    class_name: "User",
    inverse_of: :subs
  )

  has_many(
    :posted_subs,
    class_name: "PostSub",
    foreign_key: :sub_id,
    dependent: :destroy,
    inverse_of: :sub
  )

  has_many(:posts, through: :posted_subs, source: :post)
end
