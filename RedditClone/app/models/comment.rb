# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :string           not null
#  author_id         :integer          not null
#  parent_comment_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  commentable_id    :integer
#  commentable_type  :string
#

class Comment < ActiveRecord::Base
  validates :author_id, :commentable_id, :commentable_type, presence: true

  belongs_to :commentable, polymorphic: true

  belongs_to(
    :author,
    class_name: "User"
  )

  has_many(:comments, as: :commentable)

end
