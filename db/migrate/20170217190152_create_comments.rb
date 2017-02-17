class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.column :comment, :string
      t.column :rating, :string
      t.references :commentable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
