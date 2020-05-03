# frozen_string_literal: true

RSpec.describe SubscriptionsController, type: :controller do
  describe "#new" do
    it "responds with status code :ok (200)" do
      get(:new)

      expect(response).to have_http_status(:ok)
    end

    context "when subscription attributes are stored in the user session cookies" do
      before { request.session["subscription"] = { frequency: "some_random_data" } }

      # TODO: Cleanup: Avoid checking the value of an instance variable here
      it "prefills the subscription object with these attributes" do
        get(:new)

        expect(@controller.instance_variable_get(:@subscription).frequency).to eq("some_random_data")
      end
    end
  end

  describe "#create" do
    # TODO: Specs: Setup db cleanup of data created in before(:all) and create these just once
    let(:user) { FactoryBot.create(:user) }
    let(:basket) { FactoryBot.create(:basket) }
    let(:subscription_params) do
      {
        subscription: {
          user_id: user.id,
          frequency: Subscription::MONTHLY,
          basket_subscriptions_attributes: {
            0 => { quantity: "10", basket_id: basket.id }
          }
        }
      }
    end

    subject { post(:create, params: subscription_params) }

    context "when the user is logged in" do
      before { allow(controller).to receive(:current_user).and_return(user) }

      it "creates a new subscription and basket_subscription" do
        expect {
          subject
        }.to change(Subscription, :count)
          .by(1)
          .and change(BasketSubscription, :count)
          .by(1)

        expect(Subscription.last).to have_attributes(
          user_id: user.id,
          frequency: Subscription::MONTHLY
        )

        expect(BasketSubscription.last).to have_attributes(
          basket_id: basket.id,
          quantity: 10
        )
      end

      it "clear the session storage for subscription attributes" do
        request.session["subscription"] = "this should be removed afterward"

        subject

        expect(request.session["subscription"]).to be_nil
      end

      context "when the subscription creation fails" do
        let(:subscription_params) do
          {
            subscription: {
              no_good: "plz fail",
            }
          }
        end

        it "renders the page" do
          subject

          expect(response).to have_http_status(:ok)
        end
      end
    end

    context "when the user is not logged in" do
      before { allow(controller).to receive(:current_user).and_return(nil) }

      it "stores the submitted params in a session" do
        subject

        expect(request.session["subscription"].to_h).to match(
          "frequency" => "monthly",
          "basket_subscriptions_attributes" => {
            "0" => { "basket_id" => basket.id.to_s, "quantity" => "10" }
          }
        )
      end

      # TODO: Specs: stored_location_for devise method is not available here
      it "stores the location path for Devise subsequent redirection"

      it "redirects to the login page" do
        subject

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
