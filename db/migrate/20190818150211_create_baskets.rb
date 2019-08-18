# frozen_string_literal: true

class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets do |t|
      t.string(:basket_type, null: false, default: Basket::DEFAULT)
      t.float(:price, null: false)
      t.text(:content)

      t.timestamps
    end
  end
end
