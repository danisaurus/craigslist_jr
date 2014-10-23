class Post < ActiveRecord::Base
  has_many   :comments
  has_many   :replies, through: :comments
  belongs_to :user

  def increase_upvotes
    self.upvotes += 1
  end

  def increase_downvotes
    self.downvotes += 1
  end
end
