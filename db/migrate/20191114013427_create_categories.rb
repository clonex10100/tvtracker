class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :catagories do |t|
      t.string :name
      t.string :color
      t.integer :user_id
    end
  end
end
