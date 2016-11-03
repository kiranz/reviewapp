class User < ApplicationRecord
  attr_accessor :password, :email
  has_many :hotels
  validates :password, presence: true, length: {minimum: 8}
  validates :email, presence: true
  before_create -> { self.auth_token = SecureRandom.hex }

  def self.get_token(credentials)
    user = User.find_by_email_and_password(credentials[:user], credentials[:password])
    user ? user.auth_token : nil
  end
end
