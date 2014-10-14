class User < ActiveRecord::Base

  has_many :classifieds
  validates :full_name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :username, {presence:true, uniqueness: true}
  validates :password_hash, presence: true


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
