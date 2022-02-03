class User < ApplicationRecord
  has_secure_password # password hashing, check gemfile for documentation link on lines 36-37

  validates :username, presence: true, uniqueness: { case_sensitive: false } # username unique case-insensitive
  validates :password, presence: true, length: { minimum: 6 } # arbitrary minimum length, can change. For sake of simulating only secure passwords being allowed 
  validates :password_confirmation, presence: true

  def self.authenticate_user(username, password)
    user = User.find_by(username: username.strip.downcase)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
