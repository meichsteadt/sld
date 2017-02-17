class EditUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.column :admin, :boolean
    end
  end
end
