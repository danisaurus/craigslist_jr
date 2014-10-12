class CreateClassfieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string     :title
      t.text       :description
      t.string     :condition
      t.string     :location
      t.string     :zip_code
      t.integer    :price
      t.belongs_to :category

      t.timestamps
    end
  end
end
