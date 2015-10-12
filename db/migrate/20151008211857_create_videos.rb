class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :desc
      t.string :directors
      t.string :actors

      t.timestamps null: false
    end
  end
end
