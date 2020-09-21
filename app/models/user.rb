class User < ActiveRecord::Base
    has_secure_password

  validates :name, presence: true
  validates :email, presence: true, case_sensitive: false, uniqueness: true
  validates :password, :password_confirmation, presence: true, length: {minimum: 3}

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end 

end
