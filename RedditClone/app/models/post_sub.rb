# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ActiveRecord::Base
  validates :sub, presence: true
  validates :post, presence: true, uniqueness: {scope: :sub_id}

  belongs_to :sub, inverse_of: :posted_subs
  belongs_to :post, inverse_of: :posted_subs
end
