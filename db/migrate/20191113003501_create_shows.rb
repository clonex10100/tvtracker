class CreateShows < ActiveRecord::Migration[6.0]
  def change
     create_table :shows do |t|
        t.string :name
        t.integer :episodes
        t.integer :episodes_watched
        t.integer :rating
        t.string :user_id
     end
  end
end
