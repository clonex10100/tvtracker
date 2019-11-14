class CreateShows < ActiveRecord::Migration[6.0]
  def change
     create_table :shows do |t|
        t.string :name
        t.integer :episodes
        t.integer :episodes_watched
        t.integer :rating
        t.integer :user_id
        t.integer :catagory_id
     end
  end
end
