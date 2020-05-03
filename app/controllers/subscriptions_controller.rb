# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def new
    prefilled_attributes = session[:subscription]

    @subscription = Subscription.new(prefilled_attributes)

    @subscription.basket_subscriptions.build if prefilled_attributes.blank?
  end

  def create
    if current_user
      create_subscription
    else
      session[:subscription] = create_params

      store_location_for(:user, new_subscription_path)

      redirect_to(new_user_session_path)
    end
  end

  private

  def create_subscription
    subscription = Subscription.new(create_params.merge(user_id: current_user.id))

    if subscription.save
      session[:subscription] = nil

      # TODO: redirect to my subscriptions index
      redirect_to(root_path)
    else
      render 'new'
    end
  end

  def create_params
    params.require(:subscription).permit(:frequency, :start_date, :end_date, basket_subscriptions_attributes: %i[quantity basket_id])
  end
end
