class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many(:contacts, dependent: :destroy)
  has_many(:contact_shares, dependent: :destroy)
  has_many(:written_comments, class_name: 'Comment', foreign_key: :author_id)
  has_many(:comments, as: :commentable)

  has_many(:shared_contacts, through: :contact_shares, source: :contact, dependent: :destroy)

  has_many(:groups)
end
