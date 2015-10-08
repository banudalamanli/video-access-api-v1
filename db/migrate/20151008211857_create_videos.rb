class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :directors
      t.string :actors

      t.timestamps null: false
    end
  end
end
