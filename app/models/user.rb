require 'bcrypt'


class User < ActiveRecord::Base


  validates :user_name, :password_digest, :session_token, presence: true
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token


  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
  end

  def is_password?(password)
    pw_d = BCrypt::Password.new(self.password_digest)
    pw_d.is_password?(password)
  end

  def self.find_by_credentials(user_name,password)
    @user = User.find_by(user_name: user_name)
    return nil if @user.nil?
    @user.is_password?(password) ? @user : nil
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end



end
