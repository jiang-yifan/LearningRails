class Comment < ActiveRecord::Base
  validates :author_id, :body, presence: true
  validates :commentable_id, :commentable_type, presence: true

  belongs_to(:commentable, polymorphic: true)
end
