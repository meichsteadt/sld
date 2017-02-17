class EditProducts < ActiveRecord::Migration[5.0]
  def change
    change_table :products do |t|
      t.timestamps
    end
  end
end
