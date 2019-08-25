class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true, null: false
      t.references :basket, foreign_key: true, null: false
      t.integer :quantity, null: false, default: 1
      t.string :frequency, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
