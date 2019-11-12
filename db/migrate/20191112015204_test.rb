class Test < ActiveRecord::Migration[6.0]
  def change
    create_table :test do |t|
      t.string :ping
    end
  end
end
