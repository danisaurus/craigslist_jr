class Post < ActiveRecord::Base
  has_many   :comments
  has_many   :replies, through: :comments
  belongs_to :user
end
