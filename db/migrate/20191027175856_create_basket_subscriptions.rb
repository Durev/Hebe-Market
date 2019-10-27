# frozen_string_literal: true

class CreateBasketSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :basket_subscriptions do |t|
      t.references :basket, foreign_key: true, null: false
      t.references :subscription, foreign_key: true, null: false
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
