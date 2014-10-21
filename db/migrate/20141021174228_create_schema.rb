class CreateSchema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username
      t.string  :email
      t.string  :password_hash
      t.string  :avatar
      t.timestamps
    end

    create_table :images do |t|
      t.belongs_to  :classified
      t.belongs_to  :user
      t.string      :file
      t.timestamps
    end

    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.integer    :parent_comment
      t.text       :text
      t.integer    :upvotes
      t.integer    :downvotes
      t.timestamp
    end

    create_table :posts do |t|
      t.string      :title
      t.string      :url
      t.text        :text
      t.belongs_to  :user
      t.integer     :upvotes
      t.integer     :downvotes
      t.timestamp
    end

    create_table :classifieds do |t|
      t.string     :title
      t.text       :description
      t.string     :condition
      t.string     :location
      t.string     :zip_code
      t.float      :price
      t.date       :date_posted
      t.belongs_to :category
      t.belongs_to :user
      t.timestamps
    end

    create_table :categories do |t|
      t.string   :name
      t.text     :description
      t.timestamps
    end
  end
end
