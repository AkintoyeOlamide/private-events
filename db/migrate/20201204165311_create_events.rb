class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :location
      t.text :description
      t.string :title
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
