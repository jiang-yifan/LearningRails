# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :username, :password_digest, :session_token, presence:true
  validates :password, length: {minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token

  has_many(
    :subs,
    foreign_key: :moderator_id,
    inverse_of: :moderator
  )

  has_many(
    :posts,
    foreign_key: :author_id,
    inverse_of: :author
  )

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.password_digest.is_password?(password) ? user : nil
  end

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_digest
    BCrypt::Password.new(super)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_token
  end

  def reset_session_token!
    self.session_token = self.class.generate_token
    save!
  end


end
