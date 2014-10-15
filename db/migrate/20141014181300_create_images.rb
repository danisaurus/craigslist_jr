class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to  :classified
      t.string      :image

      t.timestamps
    end
  end
end
