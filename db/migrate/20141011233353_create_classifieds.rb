class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string     :title
      t.text       :description
      t.string     :condition
      t.string     :location
      t.string     :zip_code
      t.float      :price
      t.belongs_to :category
      t.belongs_to :user

      t.timestamps
    end
  end
end
