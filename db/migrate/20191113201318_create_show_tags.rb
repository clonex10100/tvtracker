class CreateShowTags < ActiveRecord::Migration[6.0]
  def change
    create_table :show_tags do |t|
      t.integer :show_id
      t.integer :tag_id
    end
  end
end
