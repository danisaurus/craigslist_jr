class Comment < ActiveRecord::Base
  # Remember to create a migration!
  has_many   :replies, class_name: "Comment",
                       foreign_key: "parent_comment"

  belongs_to :comment
  belongs_to :post
  belongs_to :user

end
