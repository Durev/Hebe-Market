# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true, null: false
      t.string :frequency, null: false
      t.date :start_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
