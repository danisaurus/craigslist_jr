class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string      :title
      t.string      :url
      t.text        :text
      t.belongs_to  :user
      t.integer     :upvotes
      t.integer     :downvotes

      t.timestamp
    end
  end
end
