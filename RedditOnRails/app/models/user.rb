class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true, uniqueness: true
  validates :password, length: {minimum: 7, allow_nil: true}
  after_initialize :ensure_session_token
  attr_reader :password

  has_many :subs

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.generate_session_token
    self.session_token = SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_parameters(username, password)
    user = User.find_by(username: username)
    return nil unless user
    return user if user.is_password?(password)
    nil
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

end
