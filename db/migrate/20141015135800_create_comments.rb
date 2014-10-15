class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.integer    :parent_comment
      t.text       :text
      t.integer    :upvotes
      t.integer    :downvotes

      t.timestamp
    end
  end
end
