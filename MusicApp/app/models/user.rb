# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, :password_digest, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}
  validates :activation_token, presence: true

  after_initialize :ensure_session_token
  after_initialize :ensure_activation_token

  has_many :notes, inverse_of: :user, dependent: :destroy

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user
      user.password_digest.is_password?(password) ? user : nil
    end
  end

  def self.generate_token
    SecureRandom::urlsafe_base64 16
  end

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_digest
    BCrypt::Password.new(super)
  end

  def reset_session_token!
    self.session_token = self.class.generate_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_token
  end

  def ensure_activation_token
    self.activation_token ||= self.class.generate_token
  end
end
