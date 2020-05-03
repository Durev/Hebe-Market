# frozen_string_literal: true

class BasketPresenter
  def self.to_collection
    Basket.all.map{ |basket| [basket.price, basket.id] }
  end
end
