# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base

  validates :title, :author_id, presence: true

  belongs_to(
    :author,
    class_name: "User",
    inverse_of: :posts
  )


  has_many(
    :posted_subs,
    class_name: "PostSub",
    foreign_key: :post_id,
    dependent: :destroy,
    inverse_of: :post
  )

  has_many(
    :comments,
    as: :commentable
  )

  has_many(:subs, through: :posted_subs, source: :sub)
end
