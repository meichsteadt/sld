class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    change_table :products do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :price, :integer
      t.column :photo, :string
    end
  end
end
