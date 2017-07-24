require 'rails_helper'

RSpec.describe IceCreamsController, type: :controller do
  render_views

  describe "GET #index" do
    it "generates a csv report" do
      get :index, format: :csv
      expect(response.headers["Content-Disposition"]).to eq "attachment"
      expect(response.body).to eq "name,servings\nVanilla,0\nChocolate,40\nCookie Dough,525\nPistachio,5\n"
    end
  end
end