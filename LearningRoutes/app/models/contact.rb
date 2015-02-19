class Contact < ActiveRecord::Base
  validates :email, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, :name, presence: true

  belongs_to(:owner, class_name: "User", foreign_key: :user_id)
  has_many(:contact_shares, dependent: :destroy)
  has_many(:comments, as: :commentable)

  has_many(:shared_users, through: :contact_shares, source: :user, dependent: :destroy)
  has_many(:groups)
end
