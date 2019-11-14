class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :color
      t.integer :user_id
      t.integer :priority
    end
  end
end
