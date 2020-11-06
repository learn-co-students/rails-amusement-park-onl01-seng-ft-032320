class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :attraction, null: false, foreign_key: true
    end
  end
end
