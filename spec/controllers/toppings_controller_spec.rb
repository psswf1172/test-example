require 'rails_helper'

RSpec.describe ToppingsController, type: :controller do
  render_views

  describe "GET #index" do
    before(:each) do
      get :index
    end

    it "returns a success code" do
      expect(response.status).to eq 200
    end

    it "returns all the toppings" do
      binding.pry
      expect(Topping.count).to eq 6
    end

    it "returns the correct toppings" do
      expect(Topping.first.name).to eq "Sprinkles"
      expect(Topping.second.name).to eq "Chocolate Chips"
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, params: { id: 1 }
    end

    it "returns a success status" do
      expect(response.status).to eq 200
    end

    it "returns the correct topping" do
      expect(response.body).to include Topping.first.name
    end
  end
end
