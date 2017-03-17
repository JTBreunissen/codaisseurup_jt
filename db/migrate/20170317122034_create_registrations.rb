class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.boolean :active
      t.decimal :guest_count

      t.timestamps
    end
  end
end
