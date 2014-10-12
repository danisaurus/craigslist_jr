
class User < ActiveRecord::Base

  validates :first_name, {presence: true}
  validates :last_name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :username, {presence:true, uniqueness: true}
  validates :password_hash, presence: true


  # Remember to create a migration!
  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(input_password)
    self.password == input_password
  end

end
