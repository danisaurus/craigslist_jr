class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to  :classified
      t.belongs_to  :user
      t.string      :file

      t.timestamps
    end
  end
end
