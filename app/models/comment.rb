class Comment < ActiveRecord::Base
  # Remember to create a migration!
  has_many   :replies, class_name: "Comment"
  belongs_to :parent_comment, class_name: "Comment"
  belongs_to :post
  belongs_to :user

end
